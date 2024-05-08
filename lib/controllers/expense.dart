import 'dart:math';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/services/expense.dart';
import '../models/expense.dart';
import 'expense_app_user.dart';

class ExpenseController extends GetxController {
  final expenses = <Map<String, dynamic>>[].obs;
  final log = Logger('ExpenseController');

  @override
  void onInit() {
    super.onInit();
    initializeUserExpenses();
  }

  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  final ExpenseService _expenseService = Get.put(ExpenseService());

  String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(userController.categories.length);
    return userController.categories[index].toLowerCase();
  }

  void setExpenses(List<Map<String, dynamic>> expenses) {
    this.expenses.value = expenses;
  }

  void addExpense(Map<String, dynamic> expense) async {
    log.info(expense);
    bool isAdded = await _expenseService.addExpense(
      Expense.fromJson(expense),
      userController.user.value.id,
    );

    if (isAdded) {
      expenses.add(expense);
      log.info('Expense added successfully');
    } else {
      log.severe('Failed to add expense');
    }
  }

  void removeExpense(String expenseId) async {
    bool isDeleted = await _expenseService.removeExpense(
      expenseId,
      userController.user.value.id,
    );
    if (isDeleted) {
      expenses.removeWhere((expense) => expense['id'] == expenseId);
      log.info('Expense removed successfully');
    } else {
      log.severe('Failed to remove expense');
    }
  }

  Future<void> initializeUserExpenses() async {
    try {
      final userExpenses = await _expenseService.getExpenses(
        userController.user.value.id,
      );
      expenses.addAll(userExpenses.map((e) => e.toJson()).toList());
      log.info('User expenses initialized successfully');
      update();
    } catch (e) {
      log.severe('Failed to initialize user expenses');
    }
  }

  List<Expense> getExpensesAsModel() {
    return expenses.map((e) => Expense.fromJson(e)).toList();
  }

  Expense findExpense(String expenseId) {
    return Expense.fromJson(expenses.firstWhere((e) => e['id'] == expenseId));
  }

  Future<bool> updateExpense(Expense expense) async {
    bool isUpdated = await _expenseService.updateExpense(
      expense,
      userController.user.value.id,
    );

    if (isUpdated) {
      expenses[expenses.indexWhere((e) => e['id'] == expense.id)] =
          expense.toJson();
      log.info('Expense updated successfully');
      return true;
    } else {
      log.severe('Failed to update expense');
      return false;
    }
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

    print("----- total expenses: ${groupedExpenses.entries.toList().length}");
    return groupedExpenses.entries.toList();
  }

  List<Expense> getExpensesByCategory(String category) {
    return expenses
        .where((expense) => expense['category'] == category)
        .map((e) => Expense.fromJson(e))
        .toList();
  }
}
