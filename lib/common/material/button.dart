import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onClickHandler,
    required this.title,
  });

  final Function onClickHandler;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.add),
      onPressed: () {
        onClickHandler();
      },
    );
  }
}
