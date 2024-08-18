import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_state.dart';
import 'package:patient_app/src/features/posts/presentation/pages/widgets/clip_path_container.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key, required this.cubit});
  final PostsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: clipPathContainer(
            context: context,
            label: "New post",
            leadingIcon: Icons.arrow_back_ios,
            onLeadingPressed: () {
              context.pop();
            }),
        body: Builder(builder: (context) {
          return BlocListener<PostsCubit, PostsState>(
            listener: (context, state) {
              if (state is CreatePostSuccessState) {
                ToastBar.onSuccess(context,
                    message: "Post created successfully", title: "Success");
              } else if (state is CreatePostErrorState) {
                ToastBar.onNetworkFailure(context,
                    networkException: state.error);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(AppSize.screenPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSize.size20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: .2,
                            blurRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Images",
                            style: StyleManager.fontMedium14.copyWith(
                              color: ColorsHelper.black,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.size10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await BlocProvider.of<PostsCubit>(context)
                                  .pickImage();
                            },
                            child: BlocBuilder<PostsCubit, PostsState>(
                              builder: (context, state) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: ColorsHelper.lightestGrey,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: ColorsHelper.primary),
                                    image: BlocProvider.of<PostsCubit>(context)
                                                .pickedPostImage !=
                                            null
                                        ? DecorationImage(
                                            image: MemoryImage(
                                              BlocProvider.of<PostsCubit>(
                                                      context)
                                                  .pickedPostImage!,
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: BlocProvider.of<PostsCubit>(context)
                                              .pickedPostImage ==
                                          null
                                      ? const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: ColorsHelper.black,
                                          ),
                                        )
                                      : const SizedBox(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.size20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSize.size20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: .2,
                            blurRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Caption",
                            style: StyleManager.fontMedium14.copyWith(
                              color: ColorsHelper.black,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.size10,
                          ),
                          TextFormField(
                            cursorColor: ColorsHelper.primary,
                            minLines: 3,
                            maxLines: 10,
                            controller: BlocProvider.of<PostsCubit>(context)
                                .postTextController,
                            decoration: InputDecoration(
                              enabledBorder: _buildBorder(Colors.black),
                              focusedBorder: _buildBorder(ColorsHelper.primary),
                              hintText: "Ask what you want ...",
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.size20,
                    ),
                    BlocBuilder<PostsCubit, PostsState>(
                      builder: (context, state) {
                        return CustomStateButton(
                          onPressed: () {
                            BlocProvider.of<PostsCubit>(context).createPost();
                          },
                          currentState: BlocProvider.of<PostsCubit>(context)
                              .newPostButtonState,
                          label: "Add Post",
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
