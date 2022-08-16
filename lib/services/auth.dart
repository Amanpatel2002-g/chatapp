import 'package:chatapp/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  U _userFromFireBaseUser(User u) {
    return U(userId: u.uid);
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return _userFromFireBaseUser(firebaseUser!);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailAndPassWord(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return _userFromFireBaseUser(firebaseUser!);
    } catch (e) {
      print(e);
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
