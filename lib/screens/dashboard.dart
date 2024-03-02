import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';
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
                      color: CupertinoColors.systemBlue),
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
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: null,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Your Top 3 Categories',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.025),
                    child: LinearPercentIndicator(
                      center: const Text(
                        'Food',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      lineHeight: screenSize.height * 0.05,
                      percent: 0.2,
                      progressColor: CupertinoColors.systemYellow,
                      barRadius: const Radius.circular(8.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.025),
                    child: LinearPercentIndicator(
                      center: const Text(
                        'Entertainment',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      lineHeight: screenSize.height * 0.05,
                      percent: 0.5,
                      progressColor: CupertinoColors.systemIndigo,
                      barRadius: const Radius.circular(8.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.025),
                    child: LinearPercentIndicator(
                      center: const Text(
                        'Transport',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      lineHeight: screenSize.height * 0.05,
                      percent: 0.9,
                      progressColor: CupertinoColors.systemMint,
                      barRadius: const Radius.circular(8.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return bodyContent;
  }
}
