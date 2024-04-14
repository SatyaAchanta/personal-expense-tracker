import 'package:flutter/material.dart';

class MyMaterialTextField extends StatelessWidget {
  const MyMaterialTextField({super.key, required this.editingController});

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: null,
      onChanged: (value) => editingController.text = value,
      textInputAction: TextInputAction.next,
    );
  }
}
