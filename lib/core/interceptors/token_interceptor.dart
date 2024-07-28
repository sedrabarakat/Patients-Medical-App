import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final String token;
  TokenInterceptor(this.token);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
