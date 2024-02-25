import 'package:flutter/cupertino.dart';

class MyCupertinoTextField extends StatelessWidget {
  const MyCupertinoTextField({
    super.key,
    required this.controller,
    this.placeholder,
  });

  final TextEditingController controller;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size deviceSize = mediaQuery.size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      height: deviceSize.height * 0.05,
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoColors.systemGrey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        // validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
      ),
    );
  }
}
