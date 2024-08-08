import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/src/features/auth/presentation/cubit/auth_cubit.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await BlocProvider.of<AuthCubit>(context).pickImage();
      },
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: CircleAvatar(
        radius: DimensionsHelper.widthPercentage(context, 15),
        backgroundColor: ColorsHelper.primary,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CircleAvatar(
              backgroundColor: ColorsHelper.lighGrey,
              backgroundImage: BlocProvider.of<AuthCubit>(context)
                          .pickedProfileImage !=
                      null
                  ? MemoryImage(
                      BlocProvider.of<AuthCubit>(context).pickedProfileImage!)
                  : null,
              radius: DimensionsHelper.widthPercentage(context, 14),
              child:
                  BlocProvider.of<AuthCubit>(context).pickedProfileImage == null
                      ? Icon(
                          Icons.person,
                          color: ColorsHelper.white,
                          size: DimensionsHelper.widthPercentage(context, 15),
                        )
                      : const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
