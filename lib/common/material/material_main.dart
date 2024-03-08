import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/screen.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Expense Tracker - Android',
      theme: getThemeData(context),
      darkTheme: getDarkThemeData(context),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
