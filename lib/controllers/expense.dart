import 'dart:math';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../models/expense.dart';
import 'expense_app_user.dart';

class ExpenseController extends GetxController {
  final expenses = <Map<String, dynamic>>[].obs;
  final log = Logger('ExpenseController');

  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(userController.categories.length);
    return userController.categories[index].toLowerCase();
  }

  @override
  void onInit() {
    // for (int i = 0; i < 20; i++) {
    //   final expense = {
    //     "id": faker.guid.guid(),
    //     "title": faker.lorem.word(),
    //     "amount": faker.randomGenerator.decimal(scale: 2),
    //     "date": faker.date
    //         .dateTime(minYear: 202, maxYear: 2025)
    //         .millisecondsSinceEpoch,
    //     "description": faker.lorem.sentence(),
    //     "place": faker.address.city(),
    //     "category": getRandomCategory(),
    //     "isFlagged": faker.randomGenerator.boolean(),
    //     "isFavorite": faker.randomGenerator.boolean(),
    //   };
    //   expenses.add(expense);
    // }
    super.onInit();
  }

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

  List<MapEntry<String, double>> groupExpensesByCategory() {
    final groupedExpenses = <String, double>{};

    for (var expense in expenses) {
      final category = expense['category'];
      final amount = expense['amount'];
      if (groupedExpenses.containsKey(category)) {
        groupedExpenses[category] = groupedExpenses[category]! + amount;
      } else {
        groupedExpenses[category] = amount;
      }
    }

    return groupedExpenses.entries.toList();
  }

  List<Expense> getExpensesByCategory(String category) {
    return expenses
        .where((expense) => expense['category'] == category)
        .map((e) => Expense.fromJson(e))
        .toList();
  }
}
