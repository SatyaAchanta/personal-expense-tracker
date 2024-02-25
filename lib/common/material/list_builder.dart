import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/expense.dart';

class MyMaterialListBuilder extends StatelessWidget {
  const MyMaterialListBuilder(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final Function removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(expenses[index].title),
          subtitle: Text(expenses[index].amount.toString()),
          onTap: () => {
            Get.snackbar(
              'Expense Details',
              'Title: ${expenses[index].title}\nPrice: ${expenses[index].amount}',
            ),
          },
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              removeExpense(expenses[index].id);
            },
          ),
        );
      },
    );
  }
}
