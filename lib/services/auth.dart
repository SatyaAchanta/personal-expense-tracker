import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/models/auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final logger = Logger('AuthService');

  Future<Auth> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Auth(user: userCredential.user, error: null);
    } on FirebaseAuthException catch (e) {
      logger.severe('FirebaseAuthException: ${e.code}');
      return Auth(user: null, error: e.code);
    } catch (e) {
      logger.severe('UserLoginException: ${e.toString()}');
      return Auth(user: null, error: e.toString());
    }
  }

  Future<Auth> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Auth(user: userCredential.user, error: null);
    } on FirebaseAuthException catch (e) {
      logger.severe('FirebaseAuthException: ${e.code}');
      return Auth(user: null, error: e.code);
    } catch (e) {
      logger.severe('UserLoginException: ${e.toString()}');
      return Auth(user: null, error: e.toString());
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the Google Sign In process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the GoogleSignInAuthentication object
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Sign in to Firebase with the Google Auth credential
    final UserCredential userCredential =
        await _auth.signInWithCredential(googleCredential);

    return userCredential.user!;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
