import 'package:dio/dio.dart';

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
    //here we should store the token locally
    //if (token != null) _dio!.interceptors.add(TokenInterceptor(token));
  }

  Dio get dio => _dio!;
}
