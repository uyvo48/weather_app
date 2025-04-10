import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

const encoder = JsonEncoder.withIndent('  ');

class DioRequestLog extends Logger {
  DioRequestLog(
    super.title, {
    required this.requestOptions,
    required this.settings,
  });

  final RequestOptions requestOptions;
  final DioLoggerSettings settings;

  @override
  String get title => WellKnownTitles.httpRequest.title;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${requestOptions.method}] $message';

    final data = requestOptions.data;
    final headers = requestOptions.headers;

    try {
      if (settings.printRequestData && data != null) {
        final prettyData = encoder.convert(data);
        msg += '\nData: $prettyData';
      }
      if (settings.printRequestHeaders && headers.isNotEmpty) {
        final prettyHeaders = encoder.convert(headers);
        msg += '\nHeaders: $prettyHeaders';
      }
    } catch (_) {}

    return msg;
  }
}

class DioResponseLog extends Logger {
  DioResponseLog(
    super.title, {
    required this.response,
    required this.settings,
  });

  final Response<dynamic> response;
  final DioLoggerSettings settings;

  @override
  String get title => WellKnownTitles.httpResponse.title;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${response.requestOptions.method}] $message';

    final responseMessage = response.statusMessage;
    final data = response.data;
    final headers = response.headers.map;

    msg += '\nStatus: ${response.statusCode}';

    if (settings.printResponseMessage && responseMessage != null) {
      msg += '\nMessage: $responseMessage';
    }

    try {
      if (settings.printResponseData && data != null) {
        final prettyData = data;
        msg += '\nData: $prettyData';
      }
      if (settings.printResponseHeaders && headers.isNotEmpty) {
        final prettyHeaders = encoder.convert(headers);
        msg += '\nHeaders: $prettyHeaders';
      }
    } catch (_) {
    }
    return msg;
  }
}

class DioErrorLog extends Logger {
  DioErrorLog(
    super.title, {
    required this.dioException,
    required this.settings,
  });

  final DioException dioException;
  final DioLoggerSettings settings;

  @override
  String get title => WellKnownTitles.httpError.title;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${dioException.requestOptions.method}] $message';

    final responseMessage = dioException.message;
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;
    final headers = dioException.requestOptions.headers;

    if (statusCode != null) {
      msg += '\nStatus: ${dioException.response?.statusCode}';
    }
    msg += '\nMessage: $responseMessage';

    if (data != null) {
      final prettyData = encoder.convert(data);
      msg += '\nData: $prettyData';
    }
    if (headers.isNotEmpty) {
      final prettyHeaders = encoder.convert(headers);
      msg += '\nHeaders: $prettyHeaders';
    }

    return msg;
  }
}
