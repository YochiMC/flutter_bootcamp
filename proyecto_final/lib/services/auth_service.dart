import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      final UserCredential userCredential = await _auth.signInWithPopup(
        googleProvider,
      );

      final User? user = userCredential.user;

      if (user != null) {
        print('inicio de sesión exitoso');
        print(user.email);
        print(user.displayName);
      } else {
        print('error');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      print('Errorcito de firebase');
      return null;
    } catch (e) {
      print('Error desconocido');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print('sesión cerrada correctamente');
    } catch (e) {
      print(e);
    }
  }
}
