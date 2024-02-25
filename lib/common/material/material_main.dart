import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Expense Tracker - Android',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
