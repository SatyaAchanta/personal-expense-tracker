import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../models/expense.dart';

class ExpenseController extends GetxController {
  final expenses = <Map<String, dynamic>>[].obs;
  final log = Logger('ExpenseController');

  void setExpenses(List<Map<String, dynamic>> expenses) {
    this.expenses.value = expenses;
  }

  void addExpense(Map<String, dynamic> expense) {
    log.info(expense);
    expenses.add(expense);
  }

  void removeExpense(String expenseId) {
    expenses.removeWhere((expense) => expense['id'] == expenseId);
  }

  List<Map<String, dynamic>> getExpenses() {
    return expenses;
  }

  List<Expense> getExpensesAsModel() {
    return expenses.map((e) => Expense.fromJson(e)).toList();
  }

  Expense findExpense(String expenseId) {
    return Expense.fromJson(
        expenses.firstWhere((expense) => expense['id'] == expenseId));
  }

  Expense updateExpense(Expense expense) {
    final index = expenses.indexWhere((e) => e['id'] == expense.id);
    expenses[index] = expense.toJson();
    return expense;
  }

  double getTotalExpenses() {
    return expenses.fold(0, (previousValue, expense) {
      return previousValue + expense['amount'];
    });
  }
}
