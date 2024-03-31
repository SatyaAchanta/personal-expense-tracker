import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/common/material/date_picker.dart';

import '../../controllers/expense.dart';
import '../../controllers/expense_app_user.dart';
import 'text_form_field.dart';

class MyMaterialForm extends StatelessWidget {
  MyMaterialForm({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ExpenseController expenseController = Get.put(ExpenseController());
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  final logger = Logger('MyMaterialForm');
  final DateFormat format = DateFormat("MM/dd/yyyy");

  String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(userController.categories.length);
    return userController.categories[index].toLowerCase();
  }

  void onDateSelected(DateTime pickedDate) {
    dateController.text = format.format(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size screenSize = mediaQuery.size;
    dateController.value =
        TextEditingValue(text: format.format(DateTime.now()));
    return Form(
      key: _formKey,
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
          MyMaterialTextFormField(
            controller: titleController,
            placeholder: 'Purchase Name',
          ),
          MyMaterialTextFormField(
            controller: placeController,
            placeholder: 'Place of purchase',
          ),
          MyMaterialTextFormField(
            controller: priceController,
            placeholder: 'Amount',
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
              horizontal: screenSize.width * 0.1,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: MyMaterialDatePicker(
              dateController: dateController,
              onDateSelected: onDateSelected,
            ),
          ),
          MyMaterialTextFormField(
            controller: descriptionController,
            placeholder: 'notes',
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.01,
              left: screenSize.width * 0.01,
              right: screenSize.width * 0.01,
            ),
            child: ElevatedButton(
              onPressed: () {
                logger.info('Save button pressed');
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
              },
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
