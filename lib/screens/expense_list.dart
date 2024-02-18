import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expense Tracker'),
      ),
      body: const Center(
        child: Text('Expense List'),
      ),
    );
  }
}
