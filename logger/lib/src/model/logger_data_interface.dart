part of '../../logger.dart';

abstract class LoggerDataInterface {
  String? get message;

  LogLevel? get logLevel;

  Exception? get exception;

  Error? get error;

  String get title;

  StackTrace? get stackTrace;

  DateTime get time;

  String generateTextMessage();
}

extension FieldsToDisplay on LoggerDataInterface {
  String get displayTitleWithTime {
    return '[$title] | $displayTime | ';
  }

  String get displayStackTrace {
    if (stackTrace == null || stackTrace == StackTrace.empty) {
      return '';
    }
    return '\nStackTrace: $stackTrace}';
  }

  String get displayException {
    if (exception == null) {
      return '';
    }
    return '\n$exception';
  }

  String get displayError {
    if (error == null) {
      return '';
    }
    return '\n$error';
  }

  String get displayMessage {
    if (message == null) {
      return '';
    }
    return '$message';
  }

  String get displayTime => TalkerDateTimeFormatter(time).timeAndSeconds;
}
