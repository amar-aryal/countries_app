import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors(this._dio);
  // final Reader _read;
  final Dio _dio;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // code goes here
    // check and handle different status codes here

    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    // code goes here
    return super.onError(err, handler);
  }
}
