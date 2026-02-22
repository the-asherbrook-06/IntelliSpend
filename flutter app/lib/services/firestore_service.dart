// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> userDocumentExists(String uid) async {
    final doc = await _db.collection('userData').doc(uid).get();
    return doc.exists;
  }

  Future<void> createUserDocument(String uid, String email, String authMethod, {String? displayName}) async {
    log("UID: $uid");
    log("Email: $email");

    await _db.collection('userData').doc(uid).set({
      'userID': uid,
      'email': email,
      'balance': 0,
      'budget': 0,
      'authMethod': authMethod,
      if (displayName != null) 'User': displayName,
    });

    log("UserData added");
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _db.collection('userData').doc(uid).get();
    return doc.data();
  }
}
