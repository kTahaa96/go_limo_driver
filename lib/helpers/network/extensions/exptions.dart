import 'package:dio/dio.dart';

abstract class ErrorParser {
  String get errorMessage;
}

class NetworkException implements Exception, ErrorParser {
  Response? response;
  String? message;

  NetworkException({this.response, this.message});

  @override
  String get errorMessage => response!.data['message'];
}
