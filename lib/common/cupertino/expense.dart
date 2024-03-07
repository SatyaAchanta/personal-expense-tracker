import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/expense.dart';
import '../../models/expense.dart';

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

  @override
  Widget build(BuildContext context) {
    String? title;
    double? amount;
    String? place;
    String? date;
    String? category;
    String? description;
    final currentExpense = expenseController.findExpense(expenseId);
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
                      prefix: const Text('Date'),
                      child: CupertinoTextFormFieldRow(
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a date' : null,
                        placeholder: 'Date of purchase',
                        keyboardType: TextInputType.datetime,
                        initialValue: format.format(
                          DateTime.fromMillisecondsSinceEpoch(
                            currentExpense.date,
                          ),
                        ),
                        onSaved: (newValue) => date = newValue,
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
