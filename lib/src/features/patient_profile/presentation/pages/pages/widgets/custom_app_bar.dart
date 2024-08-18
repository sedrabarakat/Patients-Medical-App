import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.maritalStatus,
    required this.name,
    this.backButton = false,
    this.onBackButtonPressed,
  });
  final bool backButton;
  final void Function()? onBackButtonPressed;
  final String name;
  final String maritalStatus;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: statusBarHeight,
        horizontal: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsHelper.primary.withOpacity(.8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title and action,
          Row(
            children: [
              backButton
                  ? IconButton(
                      onPressed: onBackButtonPressed,
                      icon: const Icon(Icons.arrow_back_ios),
                      color: ColorsHelper.white,
                    )
                  : IconButton(
                      onPressed: () {
                        print(BlocProvider.of<AuthCubit>(context).userData!.id);
                      },
                      icon: const Icon(Icons.more_horiz),
                      color: ColorsHelper.white,
                    ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: ColorsHelper.white,
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.size10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.size30,
              right: AppSize.size30,
              bottom: AppSize.size20,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: StyleManager.fontBold24Black
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      maritalStatus,
                      style: StyleManager.fontRegular14grey
                          .copyWith(color: ColorsHelper.white),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorsHelper.white,
                  child: CircleAvatar(
                    backgroundColor: ColorsHelper.primaryDark,
                    radius: 29,
                    child: Icon(
                      Icons.person,
                      color: ColorsHelper.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
