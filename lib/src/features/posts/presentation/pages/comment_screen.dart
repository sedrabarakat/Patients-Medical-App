import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/helper/time_helper.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/posts/data/models/comment_model.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_state.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, required this.cubit});
  final PostsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Comments"),
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<PostsCubit, PostsState>(
                  buildWhen: (previous, current) {
                    if (current is GetCommentsErrorState ||
                        current is GetCommentsLoadingState ||
                        current is GetCommentsSuccessState ||
                        current is GetCommentsPaginationError ||
                        current is GetCommentsPaginationLoading) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is GetCommentsSuccessState) {
                      return ListOfComments(
                        comments: state.comments,
                        controller: BlocProvider.of<PostsCubit>(context)
                            .getPaginationControllerComment(),
                      );
                    } else if (state is GetCommentsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsHelper.primary,
                        ),
                      );
                    } else if (state is GetCommentsErrorState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsManager.errorSign,
                            width:
                                DimensionsHelper.widthPercentage(context, 40),
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            NetworkExceptions.getErrorMessage(state.error),
                            style: StyleManager.fontBold18.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    } else if (state is GetCommentsPaginationLoading) {
                      return ListOfComments(
                        comments: state.comments,
                        controller: BlocProvider.of<PostsCubit>(context)
                            .getPaginationControllerComment(),
                      );
                    } else if (state is GetCommentsPaginationError) {
                      return ListOfComments(
                          controller: BlocProvider.of<PostsCubit>(context)
                              .getPaginationControllerComment(),
                          comments:
                              BlocProvider.of<PostsCubit>(context).comments);
                    }
                    return const SizedBox();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: BlocProvider.of<PostsCubit>(context)
                            .commentController,
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          border: _buildBorder(),
                          focusedBorder: _buildBorder(),
                          enabledBorder: _buildBorder(),
                        ),
                      ),
                    ),
                    BlocBuilder<PostsCubit, PostsState>(
                      buildWhen: (previous, current) {
                        if (current is AddCommentErrorState ||
                            current is AddCommentLoadingState ||
                            current is AddCommentSuccessstate) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                          icon: state is AddCommentLoadingState
                              ? const CircularProgressIndicator(
                                  color: ColorsHelper.primary,
                                )
                              : const Icon(
                                  Icons.send,
                                  color: ColorsHelper.primary,
                                ),
                          onPressed: () {
                            BlocProvider.of<PostsCubit>(context).addcomment(
                              postId: BlocProvider.of<PostsCubit>(context)
                                  .selectedPostId!,
                              context: context,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: ColorsHelper.primary,
      ),
    );
  }
}

class ListOfComments extends StatelessWidget {
  const ListOfComments(
      {super.key, required this.comments, required this.controller});
  final List<Comment> comments;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppSize.screenPadding),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: comment.author.image != null
                ? NetworkImage(comment.author.image!)
                : const AssetImage(
                    AssetsManager.profileImage,
                  ),
          ),
          title: Text(
              "${comment.author.firstName} ${comment.author.middleName} ${comment.author.lastName}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.text),
              const SizedBox(height: 4),
              Text(
                TimeHelper.dateFormat(date: DateTime.parse(comment.createdAt)),
                style: StyleManager.fontRegular12Black,
              ),
            ],
          ),
        );
      },
    );
  }
}
