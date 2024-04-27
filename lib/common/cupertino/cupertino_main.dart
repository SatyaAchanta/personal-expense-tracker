import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../../controllers/expense_app_user.dart';
import '../../routes/routes.dart';

class MyCupertinoApp extends StatelessWidget {
  MyCupertinoApp({super.key});
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  getFontSize(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double screenWidth = screenSize.width;
    var fontSize = 0.0;
    if (screenWidth < 600) {
      fontSize = 18;
    } else if (screenWidth < 1200) {
      fontSize = 20;
    } else {
      fontSize = 24;
    }

    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Personal Expense Tracker - iOS',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: CupertinoColors.systemBackground,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.label,
          textStyle: TextStyle(
            color: CupertinoColors.label.resolveFrom(context),
            fontSize: getFontSize(context),
          ),
        ),
      ),
      initialRoute: userController.getUser().isAuth
          ? Routes.getHomeRoute()
          : Routes.getLoginRoute(),
      getPages: Routes.routes,
    );
  }
}
