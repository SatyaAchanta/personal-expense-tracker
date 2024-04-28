import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/expense.dart';
import '../utils/logger.dart';

class ExpenseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logger = AppLogger('ExpenseService').getLogger();

  Future<List<Expense>> getExpenses(String uid) async {
    try {
      final snapshot =
          await _firestore.collection('user-expenses').doc(uid).get();
      if (snapshot.exists) {
        final data = snapshot.data();
        final expenses = data!['expenses'] as List;
        return expenses.map((e) => Expense.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      logger.severe("Get expenses failed, due to ${e.toString()}");
      return [];
    }
    // Fetch data from API
  }

  Future<bool> addExpense(Expense expense, String email) async {
    try {
      await _firestore
          .collection('user-expenses')
          .doc(email)
          .set(expense.toJson());
      return true;
    } catch (e) {
      logger.severe("Add expense failed, due to ${e.toString()}");
      return false;
    }
  }
}
