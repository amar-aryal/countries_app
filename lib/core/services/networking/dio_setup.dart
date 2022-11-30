import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_my_country/core/services/networking/app_interceptors.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options
    ..baseUrl = 'https://restcountries.com/v2/'
    ..connectTimeout = 30000
    ..receiveTimeout = 30000
    ..contentType = Headers.jsonContentType;
  dio.interceptors.addAll([
    if (kDebugMode) LogInterceptor(),
    AppInterceptors(dio),
  ]);
  return dio;
});
