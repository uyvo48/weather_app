part of '../../logger.dart';

abstract class LogFilter {
  LogLevel? _level;
  LogLevel? get level => _level ?? LogLevel.debug;

  set level(LogLevel? value) => _level = value;

  Future<void> init() async {}

  bool shouldLog(LogEvent event);

  Future<void> destroy() async {}
}
