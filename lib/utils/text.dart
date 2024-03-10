import 'package:flutter/cupertino.dart';

class MyTextStyles {
  static double smallFontsize = 16.0;
  static double mediumFontsize = 18.0;
  static double largeFontsize = 20.0;

  static final TextStyle labelSmall = TextStyle(
    fontSize: smallFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelSmallBold = TextStyle(
    fontSize: smallFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelMedium = TextStyle(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelMediumBold = TextStyle(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelLarge = TextStyle(
    fontSize: largeFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelLargeBold = TextStyle(
    fontSize: largeFontsize,
    fontWeight: FontWeight.bold,
  );

  // Define other text styles here
}
