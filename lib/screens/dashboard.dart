import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:personal_expense_tracker/common/cupertino/expense_categories.dart';

import '../common/material/expense_categories.dart';
import '../controllers/expense.dart';
import '../controllers/expense_app_user.dart';
import '../utils/screen.dart';
import '../utils/text.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    Size screenSize = getScreenSize(context);

    return SingleChildScrollView(
      child: Obx(
        () => Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                child: Text(
                  'Welcome ${userController.getUser().name}',
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
                      color: Colors.blueAccent,
                    ),
                  ),
                  footer: Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.025),
                    child: Text(
                      '${((expenseController.getTotalExpenses() / userController.getUser().budgetLimit) * 100).ceil()}% of \$${userController.getUser().budgetLimit} Budget Used',
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  progressColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.025,
                ),
                child: expenseController.groupExpensesByCategory().isNotEmpty
                    ? isIos
                        ? MyCupertinoCategoriesList(
                            expenseController: expenseController,
                          )
                        : MyMaterialCategoriesList(
                            expenseController: expenseController,
                          )
                    : const Center(
                        child: Text('No Expenses to show insights'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
