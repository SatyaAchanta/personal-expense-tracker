import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';

import '../../screens/category_expenses.dart';

class MyCupertinoCategoriesList extends StatelessWidget {
  const MyCupertinoCategoriesList({super.key, required this.expenseController});

  final ExpenseController expenseController;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
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
      children: expenseController.groupExpensesByCategory().map((entry) {
        return CupertinoListTile(
          title: Text(
            entry.key.toUpperCase().capitalizeFirst!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          additionalInfo: Text('\$${entry.value.toStringAsFixed(2)}'),
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
    );
  }
}
