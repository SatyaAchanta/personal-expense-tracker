import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: const Center(
        child: Text('Add Expense'),
      ),
    );
  }
}
