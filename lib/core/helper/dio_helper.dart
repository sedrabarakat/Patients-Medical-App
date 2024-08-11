import 'package:dio/dio.dart';
import '../data/data_source/local.dart';
import '../interceptors/token_interceptor.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();
  static Dio? _dio;
  factory DioHelper() {
    return _instance;
  }
  DioHelper._internal() {
    _dio ??= Dio();
    _dio!.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    addTokenInterceptor();
  }
  void addTokenInterceptor() async {
    final token= HiveService.Auth_Box!.get('Token');
    if (token != null) _dio!.interceptors.add(TokenInterceptor(token));
  }

  Dio get dio => _dio!;
}
