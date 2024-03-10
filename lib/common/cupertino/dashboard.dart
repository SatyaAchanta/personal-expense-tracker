import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../controllers/expense.dart';
import '../../controllers/expense_app_user.dart';
import '../../utils/screen.dart';
import '../../utils/text.dart';
import 'expense_categories.dart';

class MyCupertinoDashboard extends StatelessWidget {
  MyCupertinoDashboard({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    String username = userController.getUser().name;
    return Obx(
      () => Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Text(
                'Welcome ${username}',
                style: MyTextStyles.labelLargeBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.025),
              child: CircularPercentIndicator(
                radius: screenSize.width * 0.25,
                animationDuration: 1200,
                lineWidth: 10.0,
                circularStrokeCap: CircularStrokeCap.butt,
                percent: expenseController.getTotalExpenses() /
                    userController.getUser().budgetLimit,
                center: Text(
                  expenseController.getTotalExpenses().toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                  ),
                ),
                footer: Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.025),
                  child: Text(
                    '${((expenseController.getTotalExpenses() / userController.getUser().budgetLimit) * 100).ceil()}% of \$${userController.getUser().budgetLimit} Budget Used',
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
                progressColor: CupertinoColors.systemGreen,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.025,
              ),
              child: expenseController.groupExpensesByCategory().isNotEmpty
                  ? MyCupertinoCategoriesList(
                      expenseController: expenseController,
                    )
                  : const Center(
                      child: Text('No Expenses to show insights'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
