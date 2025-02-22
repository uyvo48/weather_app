part of '../../logger.dart';

class Logger implements LoggerDataInterface {
  Logger(
    this.message, {
    this.logLevel,
    this.exception,
    this.error,
    this.stackTrace,
    String? title,
    DateTime? time,
  }) {
    _title = title ?? "";
    _time = time ?? DateTime.now();
  }

  late DateTime _time;
  late String _title;

  @override
  final String message;

  @override
  final Exception? exception;

  @override
  final Error? error;

  @override
  final StackTrace? stackTrace;

  @override
  String get title => _title;

  @override
  final LogLevel? logLevel;

  @override
  String generateTextMessage() {
    return '$displayTitleWithTime$message$displayStackTrace';
  }

  @override
  DateTime get time => _time;
}
