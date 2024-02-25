import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/expense.dart';
import 'package:intl/intl.dart';

class MyCupertinoListBuilder extends StatelessWidget {
  const MyCupertinoListBuilder(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final Function removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: CupertinoListTile(
            title: Text(
              expenses[index].title,
              style: const TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(
              DateFormat('MMM, d, y').format(expenses[index].date.toLocal()),
            ),
            onTap: () => {
              Get.snackbar(
                'Expense Details',
                'Title: ${expenses[index].title}\nPrice: ${expenses[index].amount}',
                colorText: CupertinoColors.systemBackground,
                snackPosition: SnackPosition.BOTTOM,
              ),
            },
            trailing: Text(
              "\$${expenses[index].amount.toInt().toString()}",
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
