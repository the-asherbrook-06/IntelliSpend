# IntelliSpend
A mobile-based expense tracking application that automatically categorizes expenses using intelligent text analysis, reducing manual effort and improving expense organization.

## Overview
Managing daily expenses often involves repetitive manual categorization.  
**Smart Expense Tracker** simplifies this process by analyzing expense descriptions and automatically tagging them into relevant categories.

The project demonstrates a practical and scalable use of **Natural Language Processing (NLP)** concepts in a real-world application.

## Features
- Cross-platform mobile application
- Smart expense tagging based on description
- Manual category override option
- Organized expense history
- Cloud-based data storage
- Ready for user authentication support

## Tech Stack

### Frontend
- Flutter  
  - Cross-platform UI framework
  - Single codebase for Android & iOS

### Backend
- Python
  - Handles expense analysis and categorization logic
  - Hosted on free hosting services

### Database
- Firebase
  - Realtime database
  - Cloud storage
  - Authentication

## Smart Expense Tagging – How It Works
1. User enters expense amount and description
2. Description is sent to the backend server
3. Backend analyzes the text using keyword/NLP techniques
4. A suitable category is predicted
5. Expense is stored in Firebase with the assigned category

## System Architecture
<img src="assets/Flowchart.svg" alt="Flowchart of the Project" height="300">

## Future Enhancements
- Machine learning-based expense classification
- Expense analytics and visualization
- Budget tracking and alerts
- Bank SMS / email expense extraction
- Personalized spending insights

## Use Cases
- Personal daily expense tracking
- Student budget management
- Monthly spending analysis for professionals