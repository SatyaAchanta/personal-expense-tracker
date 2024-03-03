import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';
import 'package:personal_expense_tracker/screens/category_expenses.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    Widget bodyContent = SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Welcome Satya',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
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
                center: const Text(
                  '\$1000.00',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                  ),
                ),
                footer: Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.025),
                  child: const Text(
                    '70% of \$1500 Budget Used',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemBlue,
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
                    ? CupertinoListSection.insetGrouped(
                        backgroundColor: CupertinoColors.systemBackground,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: null,
                        ),
                        header: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Expenses By Categories",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        children: expenseController
                            .groupExpensesByCategory()
                            .map((entry) {
                          return CupertinoListTile(
                            title: Text(
                              entry.key.toUpperCase().capitalizeFirst!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            additionalInfo:
                                Text('\$${entry.value.toStringAsFixed(2)}'),
                            trailing: const CupertinoListTileChevron(),
                            onTap: () => {
                              Get.to(
                                CategoryExpenses(
                                  category: entry.key,
                                ),
                              )
                            },
                          );
                        }).toList(),
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
