import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ApiServices {
  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParams,
  });

  Future post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
  });

  Future postFiles(
    BuildContext context,
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    String? key,
  });

  Future postList(
    String path, {
    Map<String, String>? queryParams,
    List<dynamic>? body,
    FormData? formData,
  });
  Future put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
  });
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });
}
