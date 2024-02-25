import 'package:flutter/material.dart';

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
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: placeholder),
      validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
    );
  }
}
