import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/expense.dart';
import '../../models/expense.dart';
import '../../utils/text.dart';

class ExpenseDetailCupertino extends StatelessWidget {
  const ExpenseDetailCupertino({
    super.key,
    required this.expenseId,
    required this.formKey,
    required this.format,
    required this.expenseController,
  });

  final String expenseId;
  final GlobalKey<FormState> formKey;
  final DateFormat format;
  final ExpenseController expenseController;

  void _showDialog(
    BuildContext context,
    Widget child,
    Size screenSize,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: screenSize.height * 0.3,
        padding: EdgeInsets.only(top: screenSize.height * 0.02),
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
    String? title;
    double? amount;
    String? place;
    String? category;
    String? description;
    final currentExpense = expenseController.findExpense(expenseId);
    int dateInSeconds = currentExpense.date;
    DateTime expenseDate = DateTime.fromMillisecondsSinceEpoch(
      dateInSeconds,
    );
    Size screenSize = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        middle: Text(currentExpense.title),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(CupertinoIcons.back),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            expenseController.removeExpense(expenseId);
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.delete,
            color: CupertinoColors.systemRed,
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Form(
              key: formKey,
              child: CupertinoFormSection.insetGrouped(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                ),
                backgroundColor: CupertinoColors.systemBackground,
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
                        placeholder: 'Name of the purchase',
                        keyboardType: TextInputType.text,
                        initialValue: currentExpense.title,
                        onSaved: (newValue) => title = newValue,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    child: CupertinoFormRow(
                      prefix: const Text('Price'),
                      child: CupertinoTextFormFieldRow(
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a price' : null,
                        placeholder: 'Total Price',
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        initialValue: currentExpense.amount.toString(),
                        onSaved: (newValue) => amount = double.parse(newValue!),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    child: CupertinoFormRow(
                      prefix: const Text('Place'),
                      child: CupertinoTextFormFieldRow(
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a place' : null,
                        placeholder: 'Place of purchase',
                        keyboardType: TextInputType.text,
                        initialValue: currentExpense.place,
                        onSaved: (newValue) => place = newValue,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
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
                                  initialDateTime: expenseDate,
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
                              '${expenseDate.month}-${expenseDate.day}-${expenseDate.year}',
                              style: MyTextStyles.labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    child: CupertinoFormRow(
                      prefix: const Text('Category'),
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Optional',
                        keyboardType: TextInputType.multiline,
                        initialValue: currentExpense.category,
                        onSaved: (newValue) => category = newValue,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    child: CupertinoFormRow(
                      prefix: const Text('Notes'),
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Add any notes for this purchase',
                        keyboardType: TextInputType.multiline,
                        initialValue: currentExpense.description,
                        onSaved: (newValue) => description = newValue,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 4.0),
                    child: CupertinoButton.filled(
                      child: const Text('Update Expense'),
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          expenseController.updateExpense(Expense(
                            id: currentExpense.id,
                            title: title!,
                            amount: amount!,
                            place: place!,
                            date: currentExpense.date,
                            category: category!,
                            description: description!,
                            isFlagged: false,
                          ));
                          Get.back();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
