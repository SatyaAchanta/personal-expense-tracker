import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyMaterialDatePicker extends StatelessWidget {
  MyMaterialDatePicker({
    super.key,
    required this.dateController,
    required this.onDateSelected,
  });

  final TextEditingController dateController;

  final Function onDateSelected;

  final DateFormat format = DateFormat("MM/dd/yyyy");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Date',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2021),
              lastDate: DateTime(2025),
            ).then(
              (pickedDate) {
                if (pickedDate == null) {
                  return;
                }
                onDateSelected(pickedDate);
              },
            );
          },
          child: Text(
            dateController.text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
