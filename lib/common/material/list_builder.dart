import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/expense.dart';
import '../../utils/screen.dart';

class MyMaterialListBuilder extends StatelessWidget {
  const MyMaterialListBuilder(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final Function removeExpense;

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
          subtitle: Text(
              DateFormat('MMM, d, y').format(expenses[index].date.toLocal())),
          onTap: () => {
            Get.snackbar(
              'Expense Details',
              'Title: ${expenses[index].title}\nPrice: ${expenses[index].amount}',
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
