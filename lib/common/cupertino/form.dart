import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

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
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CupertinoFormSection.insetGrouped(
        header: const Center(
          child: Text(
            'Add Expense',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemBlue),
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: CupertinoFormRow(
              prefix: const Text('Name'),
              child: CupertinoTextFormFieldRow(
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                controller: titleController,
                placeholder: 'Name of the purchase',
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: CupertinoFormRow(
              prefix: const Text('Price'),
              child: CupertinoTextFormFieldRow(
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a price' : null,
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
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a place' : null,
                placeholder: 'Place of purchase',
                controller: placeController,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: CupertinoFormRow(
              prefix: const Text('Date'),
              child: CupertinoTextFormFieldRow(
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a date' : null,
                placeholder: 'Date of purchase',
                keyboardType: TextInputType.datetime,
                controller: dateController,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: CupertinoFormRow(
              prefix: const Text('Category'),
              child: CupertinoTextFormFieldRow(
                placeholder: 'Optional: Assign this purchase to a category',
                keyboardType: TextInputType.multiline,
                controller: categoryController,
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
            margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
            child: CupertinoButton.filled(
              child: const Text('Add Expense'),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   expenseController.addExpense({
                //     'id': Random().nextInt(1000),
                //     'title': titleController.text,
                //     'place': placeController.text,
                //     'amount': double.parse(priceController.text),
                //     'date': DateTime.parse(dateController.text),
                //     'description': descriptionController.text,
                //     'isFlagged': false,
                //     'category': 'food',
                //   });
                //   // Get.back();
                // }
                expenseController.addExpense({
                  'id': const Uuid().v4(),
                  'title': "Sample ${Random().nextInt(10).toString()}",
                  'place': "Home",
                  'amount': 12.toDouble(),
                  'date': DateTime.now(),
                  'description': 'testing',
                  'isFlagged': false,
                  'category': 'food',
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
