import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_expense_tracker/models/user.dart';
import 'package:personal_expense_tracker/utils/logger.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final logger = AppLogger('UserService').getLogger();

  Future<bool> createUser(ExpenseAppUser user) async {
    try {
      await _firestore.collection('users').doc(user.email).set(user.toJson());

      return true;
    } catch (e) {
      print("--- failed to write user info into the database");
      print(e.toString());
      logger.severe("Unable to write user info into the database");
      logger.severe(e.toString());
      return false;
    }
  }

  Future<bool> isUserExisting(String email) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(email).get();
      return documentSnapshot.exists;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(uid).get();
      return documentSnapshot.data() as Map<String, dynamic>;
    } catch (e) {
      logger.severe(e.toString());
      return {};
    }
  }
}
