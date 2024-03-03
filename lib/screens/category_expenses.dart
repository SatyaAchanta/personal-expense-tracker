import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/cupertino/list_builder.dart';
import '../common/material/list_builder.dart';
import '../controllers/expense.dart';

class CategoryExpenses extends StatelessWidget {
  const CategoryExpenses({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(category),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(CupertinoIcons.back),
          ),
        ),
        child: GetX<ExpenseController>(
          builder: (controller) {
            return controller.getExpensesAsModel().isEmpty
                ? const Center(
                    child: Text('No expenses yet!'),
                  )
                : isIOS
                    ? MyCupertinoListBuilder(
                        expenses: controller.getExpensesByCategory(category),
                        removeExpense: controller.removeExpense,
                      )
                    : MyMaterialListBuilder(
                        expenses: controller.getExpensesByCategory(category),
                        removeExpense: controller.removeExpense,
                      );
          },
        ),
      ),
    );
  }
}
