import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../../controllers/expense_app_user.dart';

class UserFeedbackMaterial extends StatelessWidget {
  const UserFeedbackMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Feedback'),
        ),
        body: GetBuilder<ExpenseAppUserController>(
          builder: (controller) => Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.05,
                  horizontal: size.width * 0.05,
                ),
                child: TextField(
                  controller: TextEditingController(
                      text: controller.getUser().feedbackMessage),
                  style: Theme.of(context).textTheme.titleMedium,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (value) => controller.addFeedback(value),
                  maxLines: 5,
                  key: const Key('feedbackTextField'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
