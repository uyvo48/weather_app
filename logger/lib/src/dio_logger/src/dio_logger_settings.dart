import 'package:dio/dio.dart';

class DioLoggerSettings {
  const DioLoggerSettings({
    this.printResponseData = true,
    this.printResponseHeaders = false,
    this.printResponseMessage = true,
    this.printRequestData = true,
    this.printRequestHeaders = false,
    this.requestFilter,
    this.responseFilter,
  });

  /// Print [response.data] if true
  final bool printResponseData;

  /// Print [response.headers] if true
  final bool printResponseHeaders;

  /// Print [response.statusMessage] if true
  final bool printResponseMessage;

  /// Print [request.data] if true
  final bool printRequestData;

  /// Print [request.headers] if true
  final bool printRequestHeaders;

  /// For request filtering.
  /// You can add your custom logic to log only specific HTTP requests [RequestOptions].
  final bool Function(RequestOptions requestOptions)? requestFilter;

  /// For response filtering.
  /// You can add your custom logic to log only specific HTTP responses [Response].
  final bool Function(Response response)? responseFilter;

  DioLoggerSettings copyWith({
    bool? printResponseData,
    bool? printResponseHeaders,
    bool? printResponseMessage,
    bool? printRequestData,
    bool? printRequestHeaders,
    bool Function(RequestOptions requestOptions)? requestFilter,
    bool Function(Response response)? responseFilter,
  }) {
    return DioLoggerSettings(
      printResponseData: printResponseData ?? this.printResponseData,
      printResponseHeaders: printResponseHeaders ?? this.printResponseHeaders,
      printResponseMessage: printResponseMessage ?? this.printResponseMessage,
      printRequestData: printRequestData ?? this.printRequestData,
      printRequestHeaders: printRequestHeaders ?? this.printRequestHeaders,
      requestFilter: requestFilter ?? this.requestFilter,
      responseFilter: responseFilter ?? this.responseFilter,
    );
  }
}
