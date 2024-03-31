import 'package:flutter/material.dart';

import '../../utils/screen.dart';

class MyMaterialTextFormField extends StatelessWidget {
  const MyMaterialTextFormField({
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
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.05,
          ),
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
      ),
    );
  }
}
