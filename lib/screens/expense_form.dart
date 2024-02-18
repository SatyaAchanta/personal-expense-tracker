import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/controllers/expense.dart';

class ExpenseForm extends StatelessWidget {
  ExpenseForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _placeController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size deviceSize = mediaQuery.size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Add Expense'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: deviceSize.height * 0.05,
                  left: deviceSize.width * 0.05,
                  right: deviceSize.width * 0.05,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration:
                            const InputDecoration(labelText: 'Purchase Name'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a title' : null,
                      ),
                      TextFormField(
                        controller: _placeController,
                        decoration: const InputDecoration(labelText: 'Place'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a place' : null,
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(labelText: 'Price'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a price' : null,
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(labelText: 'Date'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a date' : null,
                        keyboardType: TextInputType.datetime,
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: deviceSize.height * 0.05,
                  left: deviceSize.width * 0.05,
                  right: deviceSize.width * 0.05,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   expenseController.addExpense({
                    //     'title': "Sample",
                    //     'place': "Home",
                    //     'price': 12,
                    //     'date': '2024/01/01',
                    //     'description': 'testing',
                    //   });
                    //   // print('Title: ${_titleController.text}');
                    //   // print('Place: ${_placeController.text}');
                    //   // print('Price: ${_priceController.text}');
                    //   // print('Date: ${_dateController.text}');
                    //   // print('Description: ${_descriptionController.text}');
                    // }
                    expenseController.addExpense({
                      'title': "Sample",
                      'place': "Home",
                      'price': 12,
                      'date': '2024/01/01',
                      'description': 'testing',
                    });
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
