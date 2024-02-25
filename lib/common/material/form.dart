import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/common/material/text_field.dart';

import '../../controllers/expense.dart';

class MyMaterialForm extends StatelessWidget {
  MyMaterialForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ExpenseController expenseController = Get.put(ExpenseController());
  final logger = Logger('MyMaterialForm');

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size deviceSize = mediaQuery.size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyMaterialTextField(
            controller: titleController,
            placeholder: 'Purchase Name',
          ),
          MyMaterialTextField(
            controller: placeController,
            placeholder: 'Place of purchase',
          ),
          MyMaterialTextField(
            controller: priceController,
            placeholder: 'Amount',
          ),
          MyMaterialTextField(
            controller: dateController,
            placeholder: 'Date of purchase',
          ),
          MyMaterialTextField(
            controller: descriptionController,
            placeholder: 'notes',
          ),
          Container(
            margin: EdgeInsets.only(
              top: deviceSize.height * 0.01,
              left: deviceSize.width * 0.01,
              right: deviceSize.width * 0.01,
            ),
            child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   print("form is valid");
                //   // expenseController.addExpense({
                //   //   'title': "Sample",
                //   //   'place': "Home",
                //   //   'price': 12,
                //   //   'date': '2024/01/01',
                //   //   'description': 'testing',
                //   // });
                //   // print('Title: ${_titleController.text}');
                //   // print('Place: ${_placeController.text}');
                //   // print('Price: ${_priceController.text}');
                //   // print('Date: ${_dateController.text}');
                //   // print('Description: ${_descriptionController.text}');
                //   expenseController.addExpense({
                //     'id': Random().nextInt(100).toString(),
                //     'title': "Sample ${Random().nextInt(10).toString()}",
                //     'place': "Home",
                //     'amount': 12.toDouble(),
                //     'date': DateTime.now(),
                //     'description': 'testing',
                //   });
                // }
                expenseController.addExpense({
                  'id': Random().nextInt(100).toString(),
                  'title': "Sample ${Random().nextInt(10).toString()}",
                  'place': "Home",
                  'amount': 12.toDouble(),
                  'date': DateTime.now(),
                  'description': 'testing',
                });
                logger.info("Added Expense");
              },
              child: const Text('Add Expense'),
            ),
          ),
        ],
      ),
    );
  }
}
