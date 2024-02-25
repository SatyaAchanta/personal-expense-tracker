import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

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
          child: const Icon(CupertinoIcons.delete),
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Text(
                currentExpense.amount.toString(),
                style:
                    const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('MM/dd/yyyy').format(currentExpense.date.toLocal()),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                currentExpense.place,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                currentExpense.description,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(currentExpense.category),
            ],
          ),
        ),
      ),
    );
  }
}
