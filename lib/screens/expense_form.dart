import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/cupertino/form.dart';
import '../common/material/form.dart';
import '../controllers/expense.dart';
import '../utils/screen.dart';

class ExpenseForm extends StatelessWidget {
  ExpenseForm({super.key});
  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    bool isiOS = Theme.of(context).platform == TargetPlatform.iOS;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.05),
                child: const Text(
                  'Add Expense',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.01),
              child: isiOS ? MyCupertinoForm() : MyMaterialForm(),
            ),
          ],
        ),
      ),
    );
  }
}
