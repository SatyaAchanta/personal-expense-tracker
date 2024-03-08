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
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.05,
          ),
          child: ListTile(
            textColor: Theme.of(context).textTheme.titleMedium!.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              expenses[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              format.format(DateTime.fromMillisecondsSinceEpoch(
                expenses[index].date,
              )),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () => {
              Get.to(
                ExpenseScreen(
                  expenseId: expenses[index].id,
                ),
              ),
            },
            trailing: Text(
              "\$${expenses[index].amount.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
