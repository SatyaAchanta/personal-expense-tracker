import 'package:get/get.dart';

import '../common/material/feedback.dart';
import '../common/material/user_categories.dart';
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
  static const String userCategories = '/user-expenses';
  static const String userFeedback = '/user-feedback';

  static String getHomeRoute() => home;
  static String getExpenses() => expenses;
  static String newExpense() => addExpense;
  static String getExpense() => expense;
  static String getProfile() => profile;
  static String getCategoryExpenses() => categoryExpenses;
  static String getUserExpenses() => userCategories;
  static String getUserFeedback() => userFeedback;

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
      page: () => const Profile(),
    ),
    GetPage(
      name: categoryExpenses,
      page: () => const ExpenseList(),
    ),
    GetPage(
      name: userCategories,
      page: () => MyMaterialUserCategories(),
    ),
    GetPage(
      name: userFeedback,
      page: () => UserFeedbackMaterial(),
    ),
  ];
}
