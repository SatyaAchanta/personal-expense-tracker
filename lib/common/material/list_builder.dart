import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

import '../../models/expense.dart';
import '../../screens/expense_screen.dart';
import '../../utils/screen.dart';

class MyMaterialListBuilder extends StatelessWidget {
  MyMaterialListBuilder(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final Function removeExpense;

  final logger = Logger('MyCupertinoListBuilder');
  final DateFormat format = DateFormat("MM/dd/yyyy");

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            expenses[index].title,
            style: TextStyle(fontSize: screenSize.width * 0.05),
          ),
          subtitle: Text(format.format(expenses[index].date)),
          onTap: () => {
            Get.to(
              ExpenseScreen(
                expenseId: expenses[index].id,
              ),
            ),
          },
          trailing: Text(
            "\$${expenses[index].amount.toInt().toString()}",
            style: TextStyle(
              fontSize: screenSize.width * 0.06,
            ),
          ),
        );
      },
    );
  }
}
