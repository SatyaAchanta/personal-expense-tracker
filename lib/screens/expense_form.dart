import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/cupertino/form.dart';
import '../common/material/form.dart';
import '../controllers/expense.dart';

class ExpenseForm extends StatelessWidget {
  ExpenseForm({super.key});
  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size deviceSize = mediaQuery.size;
    bool isiOS = Theme.of(context).platform == TargetPlatform.iOS;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: deviceSize.height * 0.05,
                left: deviceSize.width * 0.01,
                right: deviceSize.width * 0.01,
              ),
              child: isiOS ? MyCupertinoForm() : MyMaterialForm(),
            ),
          ],
        ),
      ),
    );
  }
}
