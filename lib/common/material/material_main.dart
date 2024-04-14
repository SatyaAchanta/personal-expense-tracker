import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/controllers/expense_app_user.dart';

import '../../routes/routes.dart';
import '../../utils/screen.dart';

class MyMaterialApp extends StatelessWidget {
  MyMaterialApp({super.key});

  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Expense Tracker - Android',
      theme: getThemeData(context),
      darkTheme: getDarkThemeData(context),
      initialRoute: '/home',
      getPages: Routes.routes,
    );
  }
}
