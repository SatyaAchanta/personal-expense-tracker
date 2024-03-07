import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../../routes/routes.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return GetMaterialApp(
      title: 'Personal Expense Tracker - Android',
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.blue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 36),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 24),
          bodySmall: TextStyle(color: Colors.black, fontSize: 18),
          titleLarge: TextStyle(color: Colors.black54, fontSize: 36),
          titleMedium: TextStyle(color: Colors.black54, fontSize: 24),
          titleSmall: TextStyle(
              color: Colors.black54, fontSize: 12, fontStyle: FontStyle.italic),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.black,
          space: 2,
          thickness: 1,
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.02,
            fontFamily: 'serif',
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.black,
          labelStyle: TextStyle(color: Colors.grey[400]),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'serif',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
          bodySmall: TextStyle(color: Colors.white, fontSize: 12),
          titleLarge: TextStyle(color: Colors.white54, fontSize: 24),
          titleMedium: TextStyle(color: Colors.white54, fontSize: 18),
          titleSmall: TextStyle(
              color: Colors.white54, fontSize: 12, fontStyle: FontStyle.italic),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white,
          space: 2,
          thickness: 1,
        ),
        dividerColor: Colors.white,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
