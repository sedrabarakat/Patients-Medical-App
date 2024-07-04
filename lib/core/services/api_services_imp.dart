import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/src/form_data.dart';
import 'package:http/http.dart' as http;
import 'package:patient_app/core/data/enums/status_request.dart';
import 'api_services.dart';

class ApiServicesImp implements ApiServices {
  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      bool? hasToken}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String path, {Map<String, String>? queryParams, bool? hasToken}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<StatusRequest, Map>> getData(String path,
      {Map<String, String>? queryParams, bool? hasToken}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future post(String auth,
      {Map<String, dynamic>? queryParams,
       Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<StatusRequest, Map>> postData(String path, Map data) async {
    var response = await http.post(Uri.parse(path), body: data);

    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Right(responseBody);
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      return const Left(StatusRequest.serverFailure);
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  @override
  Future postList(String path,
      {Map<String, String>? queryParams,
      List? body,
      FormData? formData,
      bool? hasToken}) {
    // TODO: implement postList
    throw UnimplementedError();
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
