import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../controllers/expense.dart';
import '../models/expense.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({super.key, required this.expenseId});

  final String expenseId;

  final ExpenseController expenseController = Get.put(ExpenseController());
  final logger = Logger('ExpenseScreen');

  @override
  Widget build(BuildContext context) {
    Expense currentExpense = expenseController.findExpense(expenseId);
    Size screenSize = getScreenSize(context);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        border: null,
        middle: Text(currentExpense.title),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(CupertinoIcons.back),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            expenseController.removeExpense(expenseId);
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.delete,
            color: CupertinoColors.systemRed,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(screenSize.height * 0.02),
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.02,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: Text(
                        '\$${currentExpense.amount.toString()}',
                        style: const TextStyle(
                            fontSize: 56, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Date: ${DateFormat('MM/dd/yyyy').format(currentExpense.date.toLocal())}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Place: ${currentExpense.place}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Notes: ${currentExpense.description}',
                        style: const TextStyle(
                          fontSize: 18,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemTeal,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Category: ${currentExpense.category}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
