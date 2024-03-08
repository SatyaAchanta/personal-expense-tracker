import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../common/cupertino/expense_categories.dart';
import '../common/material/expense_categories.dart';
import '../controllers/expense.dart';
import '../controllers/expense_app_user.dart';
import '../utils/screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double totalSpent = expenseController.getTotalExpenses();
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    double totalBudget = userController.getUser().budgetLimit;
    Widget bodyContent = SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              child: const Text(
                'Welcome Satya',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.025),
              child: CircularPercentIndicator(
                radius: screenSize.width * 0.25,
                animationDuration: 1200,
                lineWidth: 10.0,
                circularStrokeCap: CircularStrokeCap.butt,
                percent: 0.7,
                center: Text(
                  totalSpent.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color:
                        isIos ? CupertinoColors.systemBlue : Colors.blueAccent,
                  ),
                ),
                footer: Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.025),
                  child: Text(
                    '${((totalSpent / totalBudget) * 100).ceil()}% of \$$totalBudget Budget Used',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: isIos
                          ? CupertinoColors.systemBlue
                          : Colors.blueAccent,
                    ),
                  ),
                ),
                progressColor: CupertinoColors.activeGreen,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.025,
              ),
              child: Obx(
                () => expenseController.groupExpensesByCategory().isNotEmpty
                    ? isIos
                        ? MyCupertinoCategoriesList(
                            expenseController: expenseController)
                        : MyMaterialCategoriesList(
                            expenseController: expenseController,
                          )
                    : const Center(
                        child: Text('No Expenses to show insights'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
    return bodyContent;
  }
}
