import 'dart:math';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/core/helper/image_helper.dart';
import 'package:patient_app/core/helper/time_helper.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:patient_app/src/features/posts/data/models/comment_model.dart';
import 'package:patient_app/src/features/posts/data/models/post_model.dart';
import 'package:patient_app/src/features/posts/domain/posts_repo.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_state.dart';
import 'package:progress_state_button/progress_button.dart';

enum LikeEnum { like, dislike }

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _repo;
  PostsCubit(this._repo) : super(PostsInitialState());
  TextEditingController postTextController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  Uint8List? pickedPostImage;
  String? imageName;
  ButtonState newPostButtonState = ButtonState.idle;
  int _pageNumber = 2;
  bool _isLoading = false;
  ScrollController? _paginationController;
  int _pageNumberComments = 2;
  bool _isLoadingComments = false;
  int? selectedPostId;
  ScrollController? _paginationControllerComments;

  List<PostModel> posts = [];
  List<Comment> comments = [];

  Future<void> getAllPosts({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(GetPostsLoadingState())
        : emit(GetPostsPaginationLoading(posts));
    final response = await _repo.getAllPosts(pageNumber: pageNumber);
    response.fold((error) {
      pageNumber == 1
          ? emit(GetPostsErrorState(error))
          : emit(GetPostsPaginationError(error));
    }, (data) {
      List<PostModel> temp = [];
      for (int i = 0; i < data.list.length; i++) {
        PostModel post = data.list[i] as PostModel;
        temp.add(post);
      }

      posts.addAll(temp);
      emit(GetPostsSuccessState(posts));
    });
  }

  Future<void> createPost() async {
    newPostButtonState = ButtonState.idle;
    emit(CreatePostLoadingState());
    final response = await _repo.createPost(
        text: postTextController.text,
        image: pickedPostImage!,
        imageName: imageName!);
    response.fold((error) {
      newPostButtonState = ButtonState.fail;
      emit(CreatePostErrorState(error));
    }, (data) {
      newPostButtonState = ButtonState.idle;
      pickedPostImage = null;
      postTextController.clear();
      emit(CreatePostSuccessState());
    });
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImageHelper.pickImage(ImageSource.gallery);

      if (pickedImage != null) {
        pickedPostImage = await pickedImage.readAsBytes();
        imageName = pickedImage.path;

        emit(PickedPostImageState());
      }
    } catch (e) {
      // todo handle this error correctly
      print(e);
    }
  }

  Future<void> likePost(int postId) async {
    handleLike(postId, LikeEnum.like);
    emit(LikePostSuccessState(postId: postId));
    final response = await _repo.likePost(postId);
    response.fold((error) {
      handleLike(postId, LikeEnum.dislike);
      emit(LikePostErrorState(postId: postId));
    }, (data) {});
  }

  Future<void> getCommentsForPost(
      {int pageNumber = 1, required int postId}) async {
    if (pageNumber == 1) {
      _pageNumberComments = 2;
      _isLoadingComments = false;
      comments.clear();
      emit(GetCommentsLoadingState());
    } else {
      emit(GetCommentsPaginationLoading(comments));
    }
    final response =
        await _repo.getCommentsForPost(pageNumber: pageNumber, postId: postId);
    response.fold((error) {
      pageNumber == 1
          ? emit(GetCommentsErrorState(error))
          : emit(GetCommentsPaginationError(error));
    }, (data) {
      List<Comment> temp = [];
      for (int i = 0; i < data.list.length; i++) {
        Comment comment = data.list[i] as Comment;
        temp.add(comment);
      }

      comments.addAll(temp);
      emit(GetCommentsSuccessState(comments));
    });
  }

  Future<void> addcomment(
      {required int postId, required BuildContext context}) async {
    emit(AddCommentLoadingState());
    final response = await _repo.addComment(
      postId: postId,
      text: commentController.text,
    );
    response.fold((error) => emit(AddCommentErrorState()), (data) {
      comments.insert(
          0,
          Comment(
            id: Random().nextInt(10000000),
            userId: BlocProvider.of<AuthCubit>(context).userData!.userId,
            commentableType: "App\\Models\\Post",
            commentableId: 1,
            text: commentController.text,
            createdAt: TimeHelper.dateFormat(date: DateTime.now()),
            updatedAt: TimeHelper.dateFormat(date: DateTime.now()),
            author: BlocProvider.of<AuthCubit>(context)
                .userData!
                .personalInformation,
          ));
      emit(AddCommentSuccessstate());
      emit(GetCommentsSuccessState(comments));
    });
  }

  String getPostImage(String image) {
    if (image.contains("https")) {
      return image;
    } else {
      return "${AppUrl.downloadFile}$image";
    }
  }

  void handleLike(int postId, LikeEnum like) {
    int index = posts.indexWhere((post) => postId == post.id);
    posts[index].liked = like == LikeEnum.like ? true : false;
  }

  ScrollController getPaginationController() {
    if (_paginationController == null) {
      _paginationController = ScrollController();
      _addPaginationListener();
    }

    return _paginationController!;
  }

  void _addPaginationListener() {
    _paginationController!.addListener(
      () async {
        if (_paginationController!.position.pixels >=
            _paginationController!.position.maxScrollExtent * .7) {
          if (!_isLoading) {
            _isLoading = true;
            await getAllPosts(pageNumber: _pageNumber++);
            _isLoading = false;
          }
        }
      },
    );
  }

  ScrollController getPaginationControllerComment() {
    if (_paginationControllerComments == null) {
      _paginationControllerComments = ScrollController();
      _addPaginationListenerComment();
    }

    return _paginationControllerComments!;
  }

  void _addPaginationListenerComment() {
    _paginationControllerComments!.addListener(
      () async {
        if (_paginationControllerComments!.position.pixels >=
            _paginationControllerComments!.position.maxScrollExtent * .7) {
          if (!_isLoadingComments) {
            _isLoadingComments = true;
            await getCommentsForPost(
                pageNumber: _pageNumberComments++, postId: selectedPostId!);
            _isLoadingComments = false;
          }
        }
      },
    );
  }

  @override
  Future<void> close() {
    _paginationController!.dispose();
    return super.close();
  }
}
