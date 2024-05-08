import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/common/material/date_picker.dart';
import 'package:uuid/uuid.dart';

import '../../controllers/expense.dart';
import '../../controllers/expense_app_user.dart';
import 'text_form_field.dart';

class MyMaterialForm extends StatefulWidget {
  const MyMaterialForm({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<MyMaterialForm> createState() => _MyMaterialFormState();
}

class _MyMaterialFormState extends State<MyMaterialForm> {
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

  final Uuid uuid = const Uuid();

  String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(userController.categories.length);
    return userController.categories[index].toLowerCase();
  }

  onPurchaseNameChanged(String value) {
    setState(() {
      titleController.text = value;
    });
  }

  onPlaceChanged(String value) {
    setState(() {
      placeController.text = value;
    });
  }

  onPriceChanged(String value) {
    setState(() {
      priceController.text = value;
    });
  }

  onDateSelected(DateTime pickedDate) {
    setState(() {
      dateController.text = format.format(pickedDate);
      // dateController.value = TextEditingValue(
      //   text: format.format(pickedDate),
      // );
    });
  }

  onDescriptionChanged(String value) {
    setState(() {
      descriptionController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size screenSize = mediaQuery.size;
    dateController.value = TextEditingValue(
      text: format.format(DateTime.now()),
    );
    return Form(
      key: MyMaterialForm._formKey,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.05),
              child: Text(
                'Add Expense',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          MyMaterialTextFormField(
            controller: titleController,
            placeholder: 'Purchase Name',
            onChanged: onPurchaseNameChanged,
          ),
          MyMaterialTextFormField(
            controller: placeController,
            placeholder: 'Place of purchase',
            onChanged: onPlaceChanged,
          ),
          MyMaterialTextFormField(
            controller: priceController,
            placeholder: 'Amount',
            onChanged: onPriceChanged,
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
            onChanged: onDescriptionChanged,
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
                if (MyMaterialForm._formKey.currentState!.validate()) {
                  print("---dateController.text--- ${dateController.text}");
                  print("------ amount ${double.parse(priceController.text)}");
                  expenseController.addExpense({
                    'id': uuid.v4(),
                    'title': titleController.text,
                    'place': placeController.text,
                    'amount': double.parse(priceController.text),
                    'date': format
                        .parse(dateController.text)
                        .millisecondsSinceEpoch,
                    'description': descriptionController.text,
                  });
                }
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
