import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_expense_tracker/common/cupertino/categories_list.dart';
import 'package:personal_expense_tracker/common/material/categories_list.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double totalSpent = expenseController.getTotalExpenses();
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
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
                    '${((totalSpent / 1500) * 100).ceil()}% of \$1500 Budget Used',
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
                            totalSpent: totalSpent,
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
