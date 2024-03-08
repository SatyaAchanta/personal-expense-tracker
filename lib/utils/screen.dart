import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  return mediaQuery.size;
}

ThemeData getThemeData(BuildContext context) {
  Size size = getScreenSize(context);
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.02,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
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
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      contentTextStyle: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 24),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
      bodySmall: TextStyle(color: Colors.black, fontSize: 12),
      titleLarge: TextStyle(color: Colors.black, fontSize: 24),
      titleMedium: TextStyle(color: Colors.black, fontSize: 18),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
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
    dividerColor: Colors.black,
    hintColor: Colors.grey,
  );
}

ThemeData getDarkThemeData(BuildContext context) {
  Size size = getScreenSize(context);
  return ThemeData(
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
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.blue,
      backgroundColor: Colors.black,
      elevation: 1.5,
      labelTextStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
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
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
      bodySmall: TextStyle(color: Colors.white, fontSize: 12),
      titleLarge: TextStyle(color: Colors.white, fontSize: 24),
      titleMedium: TextStyle(color: Colors.white, fontSize: 18),
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white,
      space: 2,
      thickness: 1,
    ),
    dividerColor: Colors.white,
  );
}
