import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_helper.dart';
import 'interceptors/app_interceptor.dart';

typedef RequestCallback = Future<Map<String, dynamic>> Function();
typedef ResponseCallback = Future<void> Function(Response);
typedef ErrorCallback = Future<void> Function(DioError);

class DioImpl extends DioHelper {
  final RequestCallback? onRequest;
  final ResponseCallback? onResponse;
  final ErrorCallback? onError;
  final String userAgent;

  final String baseURL;
  late Dio _client;

  DioImpl({
    required this.userAgent,
    required this.baseURL,
    this.onResponse,
    this.onRequest,
    this.onError,
  }) {
    _client = Dio()
      ..interceptors.addAll([
        if (kDebugMode)
          PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, error: true),
        AppInterceptors(
          onRequest,
          onResponse,
          onError,
        ),
      ])
      ..options.baseUrl = baseURL
      ..options.headers.addAll({'Accept': 'application/json', 'User-Agent': userAgent });
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
  }) {
    return _client.get(
      url,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) {
    return _client.post(
      url,
      data: data,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) {
    return _client.put(
      url,
      data: data,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) {
    return _client.delete(
      url,
      data: data,
      queryParameters: queryParams,
    );
  }
}
