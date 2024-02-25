import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/cupertino/list_builder.dart';
import '../common/material/list_builder.dart';
import '../controllers/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return SafeArea(
      child: GetX<ExpenseController>(
        builder: (controller) {
          return controller.getExpensesAsModel().isEmpty
              ? const Center(
                  child: Text('No expenses yet!'),
                )
              : isIOS
                  ? MyCupertinoListBuilder(
                      expenses: controller.getExpensesAsModel(),
                      removeExpense: controller.removeExpense,
                    )
                  : MyMaterialListBuilder(
                      expenses: controller.getExpensesAsModel(),
                      removeExpense: controller.removeExpense,
                    );
        },
      ),
    );
  }
}
