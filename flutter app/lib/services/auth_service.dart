// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class AuthService {
  // Firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Email Sign-in
  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // Email Sign-up
  signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // Sign-out
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _firebaseAuth.signOut();
  }

  // Google Sign-in
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn.instance.authenticate();
    if (gUser == null) return;
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(idToken: gAuth.idToken);
    return _firebaseAuth.signInWithCredential(credential);
  }

  // Error Handling
  getErrorMessage(String errorCode) {
    if (errorCode.contains('wrong-password')) {
      return "The Password is incorrect, please try again\nCode: wrong-password";
    } else if (errorCode.contains('user-not-found')) {
      return "No user found with this Email. Please sign up\nCode:user-not-found";
    } else if (errorCode.contains('invalid-email')) {
      return "This email doesn't exist\nCode: invalid-email";
    } else if (errorCode.contains('operation-not-allowed')) {
      return "Firebase Error, Please try again later\nCode: operation-not-allowed";
    } else if (errorCode.contains('cancelled')) {
      return "Google Sign In cancelled";
    }
    // Other Auth Exceptions can be added below
    else {
      log(errorCode);
      return "An error occured, please try again later\nCode: ${errorCode.split(' ')[0]}";
    }
  }
}
