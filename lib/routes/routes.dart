import 'package:get/get.dart';
import 'package:personal_expense_tracker/screens/dashboard.dart';

import '../screens/expense_form.dart';
import '../screens/expense_list.dart';
import '../screens/home.dart';

class Routes {
  static const String home = '/';
  static const String addExpense = '/add-expense';
  static const String dashboard = '/dashboard';
  static const String expenses = '/expenses';

  static String getHomeRoute() => home;
  static String getExpenses() => expenses;
  static String newExpense() => addExpense;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => Homepage(),
    ),
    GetPage(
      name: dashboard,
      page: () => const Dashboard(),
    ),
    GetPage(
      name: expenses,
      page: () => const ExpenseList(),
    ),
    GetPage(
      name: addExpense,
      page: () => const ExpenseForm(),
    ),
  ];
}
