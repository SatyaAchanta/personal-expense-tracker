import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyles {
  static double smallFontsize = 16.0;
  static double mediumFontsize = 18.0;
  static double largeFontsize = 20.0;

  static final TextStyle labelSmall = GoogleFonts.roboto(
    fontSize: smallFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelSmallBold = GoogleFonts.roboto(
    fontSize: smallFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelMedium = GoogleFonts.roboto(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelMediumBold = GoogleFonts.roboto(
    fontSize: mediumFontsize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelLarge = GoogleFonts.roboto(
    fontSize: largeFontsize,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelLargeBold = GoogleFonts.roboto(
    fontSize: largeFontsize,
    fontWeight: FontWeight.bold,
  );

  // Define other text styles here
}
