from sklearn.linear_model import LogisticRegression
from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
import threading
import logging
import joblib
import csv
import re
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

app = Flask(__name__)
CORS(app)

# Load vectorizer and model
logger.info("Loading vectorizer and model...")
vectorizer = joblib.load("models/vectorizer.pkl")
model = joblib.load("models/model.pkl")
logger.info("Model and vectorizer loaded successfully")

# Suggestions File
DATASET_FILE = "data/dataset.csv"
SUGGESTION_FILE = "data/suggestions.csv"
THRESHOLD = 15

# Retraining Flag
is_retraining = False

# Cleaning the input text
def clean_text(text):
    text = text.lower()
    text = re.sub(r'txn\d+', '', text)
    text = re.sub(r'#\d+', '', text)
    text = re.sub(r'\d+', '', text)
    text = re.sub(r'[^a-z\s]', '', text)
    text = re.sub(r'\s+', ' ', text).strip()
    return text

# Model Retrainer
def retrain_model():
    global model, vectorizer, is_retraining

    try:
        logger.info("Retraining started...")

        # Load original dataset
        logger.info(f"Loading original dataset from {DATASET_FILE}")
        original_df = pd.read_csv(DATASET_FILE)
 
        # Rename text column to match suggestions
        original_df = original_df.rename(
            columns={"transaction_description_c": "text"}
        )

        # Load suggestions
        logger.info(f"Loading suggestions from {SUGGESTION_FILE}")
        suggestion_df = pd.read_csv(SUGGESTION_FILE)
        suggestion_df = suggestion_df.rename(columns={"correct": "category"})
        logger.info(f"Loaded {len(suggestion_df)} suggestions")

        # Merge datasets
        logger.info("Merging datasets...")
        combined_df = pd.concat(
            [
                original_df[["text", "category"]],
                suggestion_df[["text", "category"]]
            ],
            ignore_index=True
        )
        logger.info(f"Combined dataset size: {len(combined_df)} records")
        
        # Clean text
        combined_df = combined_df.dropna(subset=["text", "category"])
        texts = combined_df["text"].apply(clean_text)
        labels = combined_df["category"]

        # Re-vectorize
        X = vectorizer.fit_transform(texts)

        # Retrain model
        logger.info("Training model...")
        model = LogisticRegression(max_iter=2000)
        model.fit(X, labels)
        logger.info("Model training completed")

        # Save updated model
        logger.info("Saving updated model and vectorizer...")
        joblib.dump(model, "models/model.pkl")
        joblib.dump(vectorizer, "models/vectorizer.pkl")

        # Clear suggestions after retrain
        os.remove(SUGGESTION_FILE)
        logger.info("Retraining completed successfully")

    except Exception as e:
        logger.error(f"Retraining failed: {e}", exc_info=True)

    finally:
        is_retraining = False
        logger.info("Retraining flag reset")

# API Route - Predict the category
@app.route("/predict", methods=["POST"])
def predict():
    try:
        data = request.get_json()
        text = data.get("text", "")
        logger.info(f"Prediction request received for text: {text[:50]}...")

        if not text:
            logger.warning("Prediction request with no text")
            return jsonify({"error": "No text provided"}), 400

        cleaned = clean_text(text)
        vector = vectorizer.transform([cleaned])
        prediction = model.predict(vector)[0]
        probabilities = model.predict_proba(vector)[0]
        confidence = max(probabilities)
        logger.info(f"Prediction: {prediction}, Confidence: {confidence:.4f}")

        classes = model.classes_
        prob_dict = {
            classes[i]: round(float(probabilities[i]), 4)
            for i in range(len(classes))
        }

        return jsonify({
            "input": text,
            "category": prediction,
            "confidence": round(float(confidence), 4),
            "all_probabilities": prob_dict
        })

    except Exception as e:
        logger.error(f"Prediction error: {e}", exc_info=True)
        return jsonify({"error": str(e)}), 500

# API Route - Accept user suggestions and retrain
@app.route("/suggest", methods=["POST"])
def suggest():
    global is_retraining

    try:
        data = request.get_json()

        text = data.get("text")
        suggested_category = data.get("suggested_category")
        user_id = data.get("user_id", "anonymous")
        logger.info(f"Suggestion received from {user_id}: {suggested_category}")

        if not text or not suggested_category:
            logger.warning("Suggestion request with missing fields")
            return jsonify({"error": "Missing required fields"}), 400

        # Save correction
        file_exists = os.path.isfile(SUGGESTION_FILE)

        with open(SUGGESTION_FILE, "a", newline="", encoding="utf-8") as f:
            writer = csv.writer(f)

            if not file_exists:
                writer.writerow(["text", "category", "user_id"])

            writer.writerow([text, suggested_category, user_id])
        logger.info(f"Suggestion saved to {SUGGESTION_FILE}")

        # Count suggestions
        suggestion_count = sum(1 for _ in open(SUGGESTION_FILE)) - 1

        # Trigger retraining if threshold reached
        if suggestion_count >= THRESHOLD and not is_retraining:
            logger.info(f"Threshold reached ({suggestion_count}/{THRESHOLD}). Triggering retraining...")
            is_retraining = True
            threading.Thread(target=retrain_model).start()

            return jsonify({
                "message": "Suggestion saved. Retraining triggered."
            })

        logger.info(f"Suggestion count: {suggestion_count}/{THRESHOLD}")
        return jsonify({
            "message": "Suggestion saved.",
            "current_count": suggestion_count
        })

    except Exception as e:
        logger.error(f"Suggestion error: {e}", exc_info=True)
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    logger.info("Starting Flask application on port 10000...")
    app.run(host="0.0.0.0", port=10000)