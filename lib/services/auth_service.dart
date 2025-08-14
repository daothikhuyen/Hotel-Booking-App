import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: non_constant_identifier_names
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  Future getCurrentUser() async{
    return _auth.currentUser;
  }

  Future<String> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'sucess';
    } on FirebaseAuthException {
      return 'Incorrect email or password';
    }
  }

  Future<String> signInUserWithGoogle() async {

    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    await _auth.signInWithCredential(credential);

    return 'sucess';
    } catch (e) {
      print(e.toString());
      return 'Google Login Failed';
    }
  }

  Future<void> signOut() async{
    await _auth.signOut();
  }
}
