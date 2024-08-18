import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/src/features/posts/data/models/comment_model.dart';
import 'package:patient_app/src/features/posts/data/models/post_model.dart';

abstract class PostsState {}

class PostsInitialState extends PostsState {}

class GetPostsLoadingState extends PostsState {}

class GetPostsPaginationLoading extends PostsState {
  final List<PostModel> posts;
  GetPostsPaginationLoading(this.posts);
}

class GetPostsSuccessState extends PostsState {
  final List<PostModel> posts;
  GetPostsSuccessState(this.posts);
}

class GetPostsErrorState extends PostsState {
  final NetworkExceptions error;
  GetPostsErrorState(this.error);
}

class GetPostsPaginationError extends PostsState {
  final NetworkExceptions error;
  GetPostsPaginationError(this.error);
}

class CreatePostSuccessState extends PostsState {}

class CreatePostLoadingState extends PostsState {}

class CreatePostErrorState extends PostsState {
  final NetworkExceptions error;
  CreatePostErrorState(this.error);
}

class LikePostSuccessState extends PostsState {
  final int postId;
  LikePostSuccessState({required this.postId});
}

class LikePostErrorState extends PostsState {
  final int postId;
  LikePostErrorState({required this.postId});
}

class PickedPostImageState extends PostsState {}

class GetCommentsLoadingState extends PostsState {}

class GetCommentsPaginationLoading extends PostsState {
  final List<Comment> comments;
  GetCommentsPaginationLoading(this.comments);
}

class GetCommentsSuccessState extends PostsState {
  final List<Comment> comments;
  GetCommentsSuccessState(this.comments);
}

class GetCommentsErrorState extends PostsState {
  final NetworkExceptions error;
  GetCommentsErrorState(this.error);
}

class GetCommentsPaginationError extends PostsState {
  final NetworkExceptions error;
  GetCommentsPaginationError(this.error);
}

class AddCommentSuccessstate extends PostsState {}

class AddCommentErrorState extends PostsState {}

class AddCommentLoadingState extends PostsState {}
