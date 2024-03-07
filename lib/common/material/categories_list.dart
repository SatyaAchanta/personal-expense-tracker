import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

class MyMaterialCategoriesList extends StatelessWidget {
  MyMaterialCategoriesList({super.key, required this.expenseController});

  final ExpenseController expenseController;
  final logger = Logger('MyMaterialCategoriesList');

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, double>> groupedExpenses =
        expenseController.groupExpensesByCategory();
    Size screenSize = getScreenSize(context);
    return Column(children: [
      Container(
        margin: EdgeInsets.only(
          top: screenSize.height * 0.025,
          bottom: screenSize.height * 0.01,
        ),
        child: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ...groupedExpenses.map((entry) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.05,
          ),
          child: ListTile(
            title: Text(
              entry.key.capitalizeFirst!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Text(
              '\$${entry.value.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () => {
              logger.fine('Tapped on category: ${entry.key}'),
            },
          ),
        );
      }),
    ]);
  }
}
