import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/posts/presentation/cubits/posts_cubit.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.image,
    required this.text,
    required this.authorName,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.liked,
  });
  final String text;
  final String image;

  final String authorName;
  final bool liked;
  final void Function()? onLikePressed;
  final void Function()? onCommentPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.h,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AssetsManager.profileImage),
                ),
                const SizedBox(
                  width: AppSize.size10,
                ),
                Text(
                  authorName,
                  style: StyleManager.fontBold16Black,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: ColorsHelper.lighGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: StyleManager.fontRegular16Black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.network(
                  BlocProvider.of<PostsCubit>(context).getPostImage(image),
                  width: DimensionsHelper.widthPercentage(context, 100) -
                      AppSize.screenPadding -
                      50,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: ColorsHelper.primary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("unable to load image"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: onLikePressed,
                          icon: Icon(
                            Icons.thumb_up_alt,
                            color: liked
                                ? ColorsHelper.primary
                                : ColorsHelper.lighGrey,
                          ),
                        ),
                        const Text(
                          '6',
                          style: StyleManager.fontRegular14Primary,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: onCommentPressed,
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        color: ColorsHelper.lighGrey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: ColorsHelper.lighGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: ColorsHelper.lighGrey,
          )
        ],
      ),
    );
  }
}
