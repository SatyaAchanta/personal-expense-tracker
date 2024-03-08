import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:personal_expense_tracker/common/cupertino/expense.dart';
import 'package:personal_expense_tracker/common/material/expense.dart';

import '../../controllers/expense.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({super.key, required this.expenseId});

  final String expenseId;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final logger = Logger('ExpenseScreen');
  final ExpenseController expenseController = Get.put(ExpenseController());

  final DateFormat format = DateFormat("MM/dd/yyyy");

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return isIos
        ? ExpenseDetailCupertino(
            expenseId: expenseId,
            formKey: _formKey,
            format: format,
            expenseController: expenseController,
          )
        : ExpenseDetailMaterial(
            expenseId: expenseId,
            formKey: _formKey,
            format: format,
            expenseController: expenseController,
          );
  }
}
