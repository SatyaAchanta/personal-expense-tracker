import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to the Personal Expense Tracker',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Please Add your budget',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
