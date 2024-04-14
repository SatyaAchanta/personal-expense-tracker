import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/utils/text.dart';

import '../../controllers/expense_app_user.dart';

class MyCupertinoUserBudget extends StatelessWidget {
  MyCupertinoUserBudget({super.key});

  final TextEditingController budgetController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.find<ExpenseAppUserController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    budgetController.text = userController.user.value.budgetLimit.toString();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        middle: const Text('Set your Budget'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: screenSize.height / 50,
          horizontal: screenSize.width / 10,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.05,
              ),
              child: CupertinoTextField(
                cursorColor: CupertinoColors.systemBlue,
                showCursor: true,
                focusNode: FocusNode(), // Create a new FocusNode
                autofocus: true, // Set autofocus to true
                // Rest of your code...
                controller: budgetController,
                placeholder: 'Enter your budget',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.send,
                suffix: CupertinoButton(
                  onPressed: () {
                    userController.updateBudgetLimit(
                      double.parse(budgetController.text),
                    );
                    Get.back();
                  },
                  child: const Icon(
                    fill: 1.00,
                    CupertinoIcons.arrow_right,
                    color: CupertinoColors.systemGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
