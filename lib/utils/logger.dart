import 'package:logging/logging.dart';

class AppLogger {
  final String loggerClass;

  AppLogger(this.loggerClass);

  Logger getLogger() {
    return Logger(loggerClass);
  }
}
