import 'package:get/get.dart';

import '../screens/dashboard.dart';
import '../screens/expense_screen.dart';
import '../screens/expense_form.dart';
import '../screens/expense_list.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class Routes {
  static const String home = '/';
  static const String addExpense = '/add-expense';
  static const String dashboard = '/dashboard';
  static const String expenses = '/expenses';
  static const String expense = '/expense';
  static const String profile = '/profile';
  static const String categoryExpenses = '/category-expenses';

  static String getHomeRoute() => home;
  static String getExpenses() => expenses;
  static String newExpense() => addExpense;
  static String getExpense() => expense;
  static String getProfile() => profile;
  static String getCategoryExpenses() => categoryExpenses;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => Homepage(),
    ),
    GetPage(
      name: dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: expenses,
      page: () => const ExpenseList(),
    ),
    GetPage(
      name: addExpense,
      page: () => ExpenseForm(),
    ),
    GetPage(
      name: expense,
      page: () => ExpenseScreen(
        expenseId: '',
      ),
    ),
    GetPage(
      name: profile,
      page: () => Profile(),
    ),
    GetPage(
      name: categoryExpenses,
      page: () => const ExpenseList(),
    ),
  ];
}