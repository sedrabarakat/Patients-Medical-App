import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/base_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/posts/data/datasources/posts_remote_data_source.dart';

class PostsRepo {
  final PostsRemoteDataSource _remote;
  PostsRepo(this._remote);

  Future<Either<NetworkExceptions, BaseModels>> getAllPosts(
      {int pageNumber = 1}) async {
    try {
      final response = await _remote.getAllPosts(pageNumber: pageNumber);

      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Map<String, dynamic>>> createPost(
      {required String text,
      required Uint8List image,
      required String imageName}) async {
    try {
      final response = await _remote.createPost(text, image, imageName);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> likePost(int postId) async {
    try {
      final response = await _remote.likePost(postId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getCommentsForPost(
      {int pageNumber = 1, required int postId}) async {
    try {
      final response = await _remote.getCommentsForPost(
          pageNumber: pageNumber, postId: postId);

      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> addComment(
      {required int postId, required String text}) async {
    try {
      final response = await _remote.addComment(postId: postId, text: text);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
