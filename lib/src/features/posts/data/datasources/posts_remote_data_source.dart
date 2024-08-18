import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/src/features/posts/data/models/comment_model.dart';
import 'package:patient_app/src/features/posts/data/models/post_model.dart';

class PostsRemoteDataSource {
  final ApiServices _service;
  PostsRemoteDataSource(this._service);

  Future<BaseModels> getAllPosts({int pageNumber = 1}) async {
    final response = await _service.get(
      AppUrl.getAllPosts,
      queryParams: {
        'per_page': "10",
        'page': "$pageNumber",
      },
    );
    return BaseModels.fromJson(
      response['data'],
      (itemJson) => PostModel.fromJson(itemJson),
    );
  }

  //todo make this PostModel
  Future<Map<String, dynamic>> createPost(
      String text, Uint8List image, String imageName) async {
    final response = await _service.post(
      AppUrl.createPost,
      formData: FormData.fromMap({
        'text': text,
        'image': MultipartFile.fromBytes(image, filename: imageName),
      }),
    );
    return response;
  }

  Future<BaseModel> likePost(int postId) async {
    await _service.post("${AppUrl.likePost}$postId");
    return BaseModel(data: null, message: "liked successfully");
  }

  Future<BaseModels> getCommentsForPost(
      {int pageNumber = 1, required int postId}) async {
    final response = await _service.get(
      "${AppUrl.getCommentForPost}$postId",
      queryParams: {
        'page': "$pageNumber",
      },
    );
    return BaseModels.fromJson(
      response['data']['data'],
      (itemJson) => Comment.fromJson(itemJson),
    );
  }

  Future<BaseModel> addComment(
      {required int postId, required String text}) async {
    final response = await _service.post("${AppUrl.addComment}$postId", body: {
      'text': text,
    });
    return BaseModel(data: null, message: response['message']);
  }
}
