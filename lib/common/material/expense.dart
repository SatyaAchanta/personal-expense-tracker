import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../../controllers/expense.dart';
import '../../models/expense.dart';

class ExpenseDetailMaterial extends StatelessWidget {
  ExpenseDetailMaterial({
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    Expense expense = expenseController.findExpense(expenseId);
    titleController.text = expense.title;
    placeController.text = expense.place;
    amountController.text = expense.amount.toString();
    dateController.text = format.format(DateTime.fromMillisecondsSinceEpoch(
      expense.date,
    ));
    descriptionController.text = expense.description;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(expense.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                expenseController.removeExpense(expense.id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Title',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: null,
                    onChanged: (value) => titleController.text = value,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Place',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: TextField(
                    controller: placeController,
                    decoration: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) => placeController.text = value,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Price',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: TextField(
                    controller: amountController,
                    decoration: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) => amountController.text = value,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Date',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: TextField(
                    controller: dateController,
                    decoration: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) => dateController.text = value,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: TextField(
                    controller: descriptionController,
                    decoration: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) => descriptionController.text = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: ElevatedButton(
                    onPressed: () {
                      expenseController.updateExpense(
                        Expense(
                          id: expense.id,
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: format
                              .parse(dateController.text)
                              .millisecondsSinceEpoch,
                          place: placeController.text,
                        ),
                      );
                      Get.back();
                    },
                    child: Text(
                      'Update',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
