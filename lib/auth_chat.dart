import 'package:firebase_auth/firebase_auth.dart';

class auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      // Check if user is already signed in
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        // Sign in anonymously if not already signed in
        UserCredential userCredential = await _auth.signInAnonymously();
        print('User signed in anonymously: ${userCredential.user?.uid}');
      } else {
        print('User is already signed in: ${currentUser.uid}');
      }
    } catch (e) {
      print('Failed to sign in anonymously: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String getCurrentUserId() {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      return '';
    }
  }
}
