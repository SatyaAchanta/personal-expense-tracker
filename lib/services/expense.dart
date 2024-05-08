import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/expense.dart';
import '../utils/logger.dart';

class ExpenseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logger = AppLogger('ExpenseService').getLogger();

  Future<List<Expense>> getExpenses(String uid) async {
    try {
      final snapshot = await _firestore
          .collection('user-expenses')
          .doc(uid)
          .collection('expenses')
          .where(FieldPath.documentId, isNotEqualTo: "info")
          .get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs
            .map((doc) => Expense.fromJson(doc.data()))
            .toList();
      }
      return [];
    } catch (e) {
      logger.severe("Get expenses failed, due to ${e.toString()}");
      return [];
    }
    // Fetch data from API
  }

  Future<bool> addExpense(Expense expense, String uid) async {
    try {
      await _firestore
          .collection('user-expenses')
          .doc(uid)
          .collection('expenses')
          .doc(expense.id)
          .set(expense.toJson());
      return true;
    } catch (e) {
      logger.severe("Add expense failed, due to ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeExpense(String expenseId, String userId) async {
    try {
      await _firestore
          .collection('user-expenses')
          .doc(userId)
          .collection('expenses')
          .doc(expenseId)
          .delete();
      return true;
    } catch (e) {
      logger.severe("Remove expense failed, due to ${e.toString()}");
      return false;
    }
  }

  Future<bool> updateExpense(Expense expense, String uid) async {
    try {
      await _firestore
          .collection('user-expenses')
          .doc(uid)
          .collection('expenses')
          .doc(expense.id)
          .update(expense.toJson());
      return true;
    } catch (e) {
      logger.severe("Update expense failed, due to ${e.toString()}");
      return false;
    }
  }
}
