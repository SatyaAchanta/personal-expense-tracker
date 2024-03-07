import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

class MyMaterialTextField extends StatelessWidget {
  const MyMaterialTextField({
    super.key,
    required this.controller,
    this.placeholder,
  });

  final TextEditingController controller;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01,
        horizontal: screenSize.width * 0.1,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.05,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
      ),
    );
  }
}
