import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../controllers/expense.dart';
import '../../utils/screen.dart';

class MyMaterialCategoriesList extends StatelessWidget {
  MyMaterialCategoriesList({super.key, required this.expenseController});

  final ExpenseController expenseController;
  final logger = Logger('MyMaterialCategoriesList');

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, double>> groupedExpenses =
        expenseController.groupExpensesByCategory();
    double totalSpent = expenseController.getTotalExpenses();
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
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            title: Text(
              entry.key.capitalizeFirst!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Text(
              '${(entry.value / totalSpent * 100).round()}%',
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
