// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> userDocumentExists(String uid) async {
    final doc = await _db.collection('userData').doc(uid).get();
    return doc.exists;
  }

  Future<void> createUserDocument(
    String uid,
    String email,
    String authMethod, {
    String? displayName,
  }) async {
    log("UID: $uid");
    log("Email: $email");

    await _db.collection('userData').doc(uid).set({
      'userID': uid,
      'email': email,
      'balance': 0,
      'budget': 0,
      'authMethod': authMethod,
      'User': displayName ?? "User",
    });

    log("UserData added");
  }

  Future<void> addTransaction(String uid, Map<String, dynamic> transactionData) async {
    await _db.collection('userData').doc(uid).collection('transactions').add(transactionData);
    log("Transaction added");
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _db.collection('userData').doc(uid).get();
    return doc.data();
  }

  Stream<QuerySnapshot> getTransactions(String uid, {int? limit}) {
    var query = _db
        .collection('userData')
        .doc(uid)
        .collection('transactions')
        .orderBy('date', descending: true);
    
    if (limit != null) {
      query = query.limit(limit);
    }
    
    return query.snapshots();
  }

  Future<void> updateTransaction(String uid, String transactionId, Map<String, dynamic> data) async {
    await _db.collection('userData').doc(uid).collection('transactions').doc(transactionId).update(data);
    log("Transaction updated");
  }

  Future<void> deleteTransaction(String uid, String transactionId) async {
    await _db.collection('userData').doc(uid).collection('transactions').doc(transactionId).delete();
    log("Transaction deleted");
  }
}
