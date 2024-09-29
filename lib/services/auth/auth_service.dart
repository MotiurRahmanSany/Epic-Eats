import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get instance of firebase auth
  final _firebaseAuth = FirebaseAuth.instance;

  // get current user

  User? get currentUser => _firebaseAuth.currentUser;

  // sign in

  Future<UserCredential?> signUserIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }

  // sign up

  Future<UserCredential?> signUserUp(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }

  // sign out

  Future<void> signUserOut() async {
    await _firebaseAuth.signOut();
  }
}
