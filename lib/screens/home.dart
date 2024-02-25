import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/common/cupertino/app_scaffold.dart';
import 'package:personal_expense_tracker/common/material/app_scaffold.dart';

import '../controllers/dashboard.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    var isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS ? MyCupertinoScaffold() : const MyMaterialScaffold();
  }
}
