import 'package:base_starter/src/core/resource/data/api/error_interceptor.dart';
import 'package:base_starter/src/core/resource/domain/api/base_http.dart';
import 'package:base_starter/src/core/utils/talker_logger.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class HttpQuery implements BaseHttp {
  final bool useGeneralDio;
  HttpQuery({
    this.useGeneralDio = false,
  });

  static const String baseUrl = 'https://django-app.loca-app.me/api/';

  ///* ---------------------------------- [HttpQuery] ---------------------------------- */
  /// This class contains custom methods for making http requests.

  /// `GET` method
  @override
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      final Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      final Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);
      final Response<dynamic> result = await getDio().get(
        url,
        options: Options(
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 60000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// `POST` method
  @override
  Future<dynamic> post({
    required String url,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      final Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      final Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);

      final Response<dynamic> result = await getDio().post(
        url,
        options: Options(
          method: 'POST',
          sendTimeout: const Duration(milliseconds: 120000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// `PATCH` method
  @override
  Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      final Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      final Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);

      final Response<dynamic> result = await getDio().patch(
        url,
        options: Options(
          method: 'PATCH',
          sendTimeout: const Duration(milliseconds: 120000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// `PUT` method
  @override
  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      final Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      if (headerData != null) header.addAll(headerData);
      final Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      final Response<dynamic> result = await getDio().put(
        url,
        options: Options(
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// `DELETE` method
  @override
  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      final Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      final Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);
      final Response<dynamic> result = await getDio().delete(
        url,
        options: Options(
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }
}

Dio getDio() {
  final Dio dio = Dio(BaseOptions(baseUrl: HttpQuery.baseUrl));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async => handler.next(options),
      onError: (DioException e, handler) async => handler.next(e),
    ),
  );
  dio.interceptors.add(ErrorInterceptor());

  /// Adds [TalkerDioLogger] to intercept Dio requests and responses and log them using Talker service.
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        errorPen: AnsiPen()..red(bold: true),
      ),
    ),
  );
  return dio;
}

Dio getGeneralDio() {
  final Dio dio = Dio();

  /// Adds [ErrorInterceptor] to intercept and handle Dio errors across the app.
  dio.interceptors.add(ErrorInterceptor());

  /// Adds [TalkerDioLogger] to intercept Dio requests and responses and log them using Talker service.
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        errorPen: AnsiPen()..red(bold: true),
      ),
    ),
  );
  return dio;
}
