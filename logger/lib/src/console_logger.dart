part of '../logger.dart';

typedef LogCallback = void Function(LogEvent event);

typedef OutputCallback = void Function(OutputEvent event);

class ConsoleLogger {
  static LogLevel level = LogLevel.debug;

  /// The current default implementation of log filter.
  static LogFilter Function() defaultFilter = () => DevelopmentFilter();

  /// The current default implementation of log printer.
  static LogPrinter Function() defaultPrinter = () => PrettyPrinter();

  /// The current default implementation of log output.
  static LogOutput Function() defaultOutput = () => ConsoleOutput();

  static final Set<LogCallback> _logCallbacks = {};

  static final Set<OutputCallback> _outputCallbacks = {};

  final LogFilter _filter;
  final LogPrinter _printer;
  final LogOutput _output;
  bool _active = true;

  /// Create a new instance of Logger.
  ///
  /// You can provide a custom [printer], [filter] and [output]. Otherwise the
  /// defaults: [PrettyPrinter], [DevelopmentFilter] and [ConsoleOutput] will be
  /// used.
  ConsoleLogger({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
    LogLevel? level,
  })  : _filter = filter ?? defaultFilter(),
        _printer = printer ?? defaultPrinter(),
        _output = output ?? defaultOutput() {
    _filter.init();
    if (level != null) {
      _filter.level = level;
    }
    _printer.init();
    _output.init();
  }

  /// Log a message at level [Level.debug].
  void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.debug,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(LogLevel.info, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(LogLevel.warning, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.error,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message with [level].
  void log(
    LogLevel level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!_active) {
      throw ArgumentError('Logger has already been closed.');
    } else if (error != null && error is StackTrace) {
      throw ArgumentError('Error parameter cannot take a StackTrace!');
    } else if (level == LogLevel.all) {
      throw ArgumentError('Log events cannot have Level.all');
    }

    var logEvent = LogEvent(
      level,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
    for (var callback in _logCallbacks) {
      callback(logEvent);
    }

    if (_filter.shouldLog(logEvent)) {
      var output = _printer.log(logEvent);

      if (output.isNotEmpty) {
        var outputEvent = OutputEvent(logEvent, output);

        try {
          for (var callback in _outputCallbacks) {
            callback(outputEvent);
          }
          _output.output(outputEvent);
        } catch (e, s) {
          if (kDebugMode) {
            print(e);
            print(s);
          }
        }
      }
    }
  }

  bool isClosed() {
    return !_active;
  }

  /// Closes the logger and releases all resources.
  Future<void> close() async {
    _active = false;
    await _filter.destroy();
    await _printer.destroy();
    await _output.destroy();
  }

  /// Register a [LogCallback] which is called for each new [LogEvent].
  static void addLogListener(LogCallback callback) {
    _logCallbacks.add(callback);
  }

  /// Removes a [LogCallback] which was previously registered.
  ///
  /// Returns whether the callback was successfully removed.
  static bool removeLogListener(LogCallback callback) {
    return _logCallbacks.remove(callback);
  }

  /// Register an [OutputCallback] which is called for each new [OutputEvent].
  static void addOutputListener(OutputCallback callback) {
    _outputCallbacks.add(callback);
  }

  /// Removes a [OutputCallback] which was previously registered.
  ///
  /// Returns whether the callback was successfully removed.
  static void removeOutputListener(OutputCallback callback) {
    _outputCallbacks.remove(callback);
  }
}
