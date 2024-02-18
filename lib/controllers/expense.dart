import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final expenses = <Map<String, dynamic>>[].obs;

  void setExpenses(List<Map<String, dynamic>> expenses) {
    this.expenses.value = expenses;
  }

  void addExpense(Map<String, dynamic> expense) {
    expenses.add(expense);
  }

  void removeExpense(int index) {
    expenses.removeAt(index);
  }

  List<Map<String, dynamic>> getExpenses() {
    return expenses;
  }
}
