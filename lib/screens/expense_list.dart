import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  // final controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: GetX<ExpenseController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.expenses.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.expenses[index]['title']),
                subtitle: Text(controller.expenses[index]['price'].toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.removeExpense(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
