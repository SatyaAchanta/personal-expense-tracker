import 'package:flutter/widgets.dart';

Size getScreenSize(BuildContext context) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  return mediaQuery.size;
}
