import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

abstract class AppLog {
  const AppLog._();

  static final ConsoleLogger _loggerNoStack = ConsoleLogger(
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: true,
      errorMethodCount: 0,
    ),
    output: ConsoleOutput(),
    filter: DevelopmentFilter(),
  );

  static debug(dynamic message, {String tag = "Debug"}) {
    if (kDebugMode) {
      _loggerNoStack.debug(message, error: tag);
    }
  }

  static info(dynamic message, {String tag = "Info"}) {
    if (kDebugMode) {
      _loggerNoStack.info(message, error: tag);
    }
  }

  static warning(dynamic message, {String tag = "Warning"}) {
    if (kDebugMode) {
      _loggerNoStack.warning(message, error: tag);
    }
  }

  static error(dynamic message, {String tag = "Error"}) {
    if (kDebugMode) {
      _loggerNoStack.error(message, error: tag);
    }
  }
}
