import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String uid, String email) async {
    try {
      await _firestore.collection('users').doc(email).set({
        'email': email,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(uid).get();
      return documentSnapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
