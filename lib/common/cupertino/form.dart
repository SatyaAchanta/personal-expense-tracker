import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/utils/screen.dart';
import 'package:uuid/uuid.dart';

import '../../controllers/expense.dart';
import '../../controllers/expense_app_user.dart';
import '../../utils/text.dart';

class MyCupertinoForm extends StatelessWidget {
  MyCupertinoForm({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final myFocusNode = FocusNode();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(userController.categories.length);
    return userController.categories[index].toLowerCase();
  }

  final logger = Logger('MyCupertinoForm');
  final ExpenseController expenseController = Get.put(ExpenseController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final DateFormat format = DateFormat("MM/dd/yyyy");

  void _showDialog(
    BuildContext context,
    Widget child,
    Size screenSize,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: screenSize.height * 0.3,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    DateTime date = DateTime.now();
    return Form(
      key: _formKey,
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context),
        ),
        header: const Center(
          child: Text(
            'Add Expense',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: CupertinoFormRow(
              prefix: const Text('Name'),
              child: CupertinoTextFormFieldRow(
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                controller: titleController,
                placeholder: 'Name of the purchase',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: CupertinoFormRow(
              prefix: const Text('Price'),
              child: CupertinoTextFormFieldRow(
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a price' : null,
                placeholder: 'Total Price',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: priceController,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: CupertinoFormRow(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Date"),
                  CupertinoButton(
                    onPressed: () {
                      _showDialog(
                        context,
                        CupertinoDatePicker(
                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This shows day of week alongside day of month
                          showDayOfWeek: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            print(newDate.millisecondsSinceEpoch);
                          },
                        ),
                        screenSize,
                      );
                    },
                    child: Text(
                      '${date.month}-${date.day}-${date.year}',
                      style: MyTextStyles.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: CupertinoFormRow(
              prefix: const Text('Category'),
              child: CupertinoTextFormFieldRow(
                placeholder: 'Category of the purchase',
                keyboardType: TextInputType.multiline,
                controller: categoryController,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
            margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 4.0),
            child: CupertinoButton.filled(
              child: const Text('Add Expense'),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   expenseController.addExpense({
                //     'id': Random().nextInt(1000),
                //     'title': titleController.text,
                //     'place': placeController.text,
                //     'amount': double.parse(priceController.text),
                //     'date': format.parse(dateController.text),
                //     'description': descriptionController.text,
                //     'isFlagged': false,
                //     'category': 'food',
                //   });
                //   // Get.back();
                // }
                expenseController.addExpense({
                  'id': const Uuid().v4(),
                  'title': 'Satya Testing',
                  'place': 'Home',
                  'amount': double.parse('12.45'),
                  'date': DateTime.now().millisecondsSinceEpoch,
                  'description': 'Sample Description for purchase',
                  'category': getRandomCategory(),
                  'isFlagged': false,
                  'isFavorite': false,
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
