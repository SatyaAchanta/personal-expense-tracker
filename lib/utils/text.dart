import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyles {
  static double smallFontsize = 16.0;
  static double mediumFontsize = 18.0;
  static double largeFontsize = 20.0;

  static final TextStyle labelSmall = GoogleFonts.lato(
    fontSize: smallFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelSmallBold = GoogleFonts.lato(
    fontSize: smallFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelMedium = GoogleFonts.lato(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelMediumBold = GoogleFonts.lato(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelLarge = GoogleFonts.lato(
    fontSize: largeFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelLargeBold = GoogleFonts.lato(
    fontSize: largeFontsize,
    fontWeight: FontWeight.bold,
  );

  // Define other text styles here
}
