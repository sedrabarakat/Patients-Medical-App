import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/domain/services/locator.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/widgets/clip_path_container.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/posts/data/models/post_model.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_state.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/app_bar.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(getIt())..getAllPosts(),
      child: BlocListener<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is GetPostsErrorState) {
            ToastBar.onNetworkFailure(context, networkException: state.error);
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
              backgroundColor: ColorsHelper.white,
              appBar: appBar(
                  title: "Posts",
                  leadingIcon: Icons.add,
                  onLeadingPressed: () {
                    context.push(AppRouter.kNewPost,
                        extra: BlocProvider.of<PostsCubit>(context));
                  }),
              body: Stack(
                children: [
                  BlocBuilder<PostsCubit, PostsState>(
                    buildWhen: (previous, current) {
                      if (current is GetPostsErrorState ||
                          current is GetPostsSuccessState ||
                          current is GetPostsLoadingState ||
                          current is GetPostsPaginationError ||
                          current is GetPostsPaginationLoading) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is GetPostsLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: ColorsHelper.primary,
                          ),
                        );
                      } else if (state is GetPostsSuccessState) {
                        return ListOfPosts(
                          posts: state.posts,
                          controller: BlocProvider.of<PostsCubit>(context)
                              .getPaginationController(),
                        );
                      } else if (state is GetPostsPaginationLoading) {
                        return ListOfPosts(
                          posts: state.posts,
                          controller: BlocProvider.of<PostsCubit>(context)
                              .getPaginationController(),
                        );
                      } else if (state is GetPostsPaginationError) {
                        return ListOfPosts(
                          posts: BlocProvider.of<PostsCubit>(context).posts,
                          controller: BlocProvider.of<PostsCubit>(context)
                              .getPaginationController(),
                        );
                      }
                      //todo handle the error in more beautiful way
                      else if (state is GetPostsErrorState) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetsManager.errorSign,
                                width: DimensionsHelper.widthPercentage(
                                    context, 40),
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
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  ClipPathContainer(),
                ],
              ));
        }),
      ),
    );
  }
}

class ListOfPosts extends StatelessWidget {
  const ListOfPosts({
    super.key,
    required this.posts,
    required this.controller,
  });
  final List<PostModel> posts;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller:
          BlocProvider.of<PostsCubit>(context).getPaginationController(),
      itemBuilder: (context, index) => BlocBuilder<PostsCubit, PostsState>(
        buildWhen: (previous, current) {
          if (current is LikePostSuccessState &&
              current.postId == posts[index].id) {
            return true;
          } else if (current is LikePostErrorState &&
              current.postId == posts[index].id) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, likeState) {
          return PostCard(
            text: posts[index].text,
            image: posts[index].image,
            authorName: posts[index].author.fullName,
            liked: posts[index].liked,
            onLikePressed: () {
              BlocProvider.of<PostsCubit>(context).likePost(posts[index].id);
            },
            onCommentPressed: () {
              BlocProvider.of<PostsCubit>(context).selectedPostId =
                  posts[index].id;
              BlocProvider.of<PostsCubit>(context)
                  .getCommentsForPost(postId: posts[index].id);
              context.push(
                AppRouter.kComment,
                extra: BlocProvider.of<PostsCubit>(context),
              );
            },
          );
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(),
      itemCount: posts.length,
      padding: EdgeInsets.only(top: 34.h, bottom: kBottomNavigationBarHeight),
    );
  }
}
