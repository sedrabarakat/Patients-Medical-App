import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data/enums/status_request.dart';

abstract class ApiServices {
  Future<dynamic> get(String path,
      {Map<String, String>? queryParams, bool? hasToken});

  Future post(String auth,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic> body,
      FormData? formData,
      bool? hasToken});

  Future postList(
    String path, {
    Map<String, String>? queryParams,
    List<dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });

  Future put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool? hasToken,
  });

  // HTTP request
  Future<Either<StatusRequest, Map>> postData(String path, Map data);
  Future<Either<StatusRequest, Map>> getData(String path,{Map<String, String>? queryParams, bool? hasToken} );
}
