import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger extends Interceptor {
  DioLoggerSettings settings;

  DioLogger({
    this.settings = const DioLoggerSettings(),
  });

  final ConsoleLogger _consoleLogger = ConsoleLogger(
    filter: DevelopmentFilter(),
    level: LogLevel.debug,
    output: ConsoleOutput(),
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      printTime: true,
      colors: true,
    ),
  );

  void configure({
    bool? printResponseData,
    bool? printResponseHeaders,
    bool? printResponseMessage,
    bool? printRequestData,
    bool? printRequestHeaders,
  }) {
    settings = settings.copyWith(
      printRequestData: printRequestData,
      printRequestHeaders: printRequestHeaders,
      printResponseData: printResponseData,
      printResponseHeaders: printResponseHeaders,
      printResponseMessage: printResponseMessage,
    );
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    super.onRequest(options, handler);

    final accepted = settings.requestFilter?.call(options) ?? true;
    if (!accepted) {
      return;
    }
    try {
      final message = '${options.uri}';
      final httpLog = DioRequestLog(
        message,
        requestOptions: options,
        settings: settings,
      );

      _consoleLogger.info(httpLog.generateTextMessage());
    } catch (_) {
      //pass
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final accepted = settings.responseFilter?.call(response) ?? true;
    if (!accepted) {
      return;
    }
    try {
      final message = '${response.requestOptions.uri}';
      final httpLog = DioResponseLog(
        message,
        settings: settings,
        response: response,
      );

      _consoleLogger.debug(httpLog.generateTextMessage());
    } catch (_) {
      //pass
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    try {
      final message = '${err.requestOptions.uri}';
      final httpErrorLog = DioErrorLog(
        message,
        dioException: err,
        settings: settings,
      );
      _consoleLogger.error(httpErrorLog.generateTextMessage());
    } catch (_) {
      //pass
    }
  }
}
