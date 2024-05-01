import 'package:flutter/material.dart';

import '../../utils/screen.dart';

class MyMaterialTextFormField extends StatelessWidget {
  const MyMaterialTextFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.placeholder,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final String? placeholder;
  final TextInputType? keyboardType;

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
          labelText: placeholder,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.05,
          ), // use OutlineInputBorder to display the label as part of the border
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
