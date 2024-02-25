import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Personal Expense Tracker - iOS',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: CupertinoColors.systemBackground,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
