import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../controllers/expense.dart';

class MyCupertinoForm extends StatelessWidget {
  MyCupertinoForm({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final myFocusNode = FocusNode();
  final logger = Logger('MyCupertinoForm');
  final ExpenseController expenseController = Get.put(ExpenseController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      key: _formKey,
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CupertinoFormRow(
            prefix: const Text('Name'),
            child: CupertinoTextFormFieldRow(
              controller: titleController,
              placeholder: 'Name of the purchase',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CupertinoFormRow(
            prefix: const Text('Price'),
            child: CupertinoTextFormFieldRow(
              placeholder: 'Total Price',
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CupertinoFormRow(
            prefix: const Text('Place'),
            child: CupertinoTextFormFieldRow(
              placeholder: 'Place of purchase',
              controller: placeController,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CupertinoFormRow(
            prefix: const Text('Date'),
            child: CupertinoTextFormFieldRow(
              placeholder: 'Date of purchase',
              keyboardType: TextInputType.datetime,
              controller: dateController,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CupertinoFormRow(
            prefix: const Text('Notes'),
            child: CupertinoTextFormFieldRow(
              placeholder: 'Add any notes for this purchase',
              keyboardType: TextInputType.multiline,
              controller: descriptionController,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: CupertinoButton.filled(
            child: const Text('Add Expense'),
            onPressed: () {
              logger.info("Added Expense");
              expenseController.addExpense({
                'id': Random().nextInt(100).toString(),
                'title': "Sample ${Random().nextInt(10).toString()}",
                'place': "Home",
                'amount': 12.toDouble(),
                'date': DateTime.now(),
                'description': 'testing',
              });
            },
          ),
        ),
      ],
    );
  }
}
