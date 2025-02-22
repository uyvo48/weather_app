part of '../logger.dart';

enum LogLevel {
  all(0),
  debug(2000),
  info(3000),
  warning(4000),
  error(5000);

  final int value;

  const LogLevel(this.value);
}
