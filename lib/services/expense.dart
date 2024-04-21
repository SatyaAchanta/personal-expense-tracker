import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/expense.dart';
import '../utils/logger.dart';

class ExpenseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logger = AppLogger('ExpenseService').getLogger();

  Future<List<Expense>> getExpenses() async {
    return [];
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
