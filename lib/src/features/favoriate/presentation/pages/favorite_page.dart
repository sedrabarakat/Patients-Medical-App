import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/domain/services/locator.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/widgets/flexible_appbar.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_cubit.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_states.dart';

import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/clip_path_container.dart';
import '../widget/doctor_cell.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavCubit(getIt())..getFav(),
        child: BlocConsumer<FavCubit, FavStates>(
          listener: (context, state) {},
          builder: (context, state) {
            FavCubit favCubit = FavCubit.get(context);
            return Scaffold(
                appBar: appBarS(title: "My Favorite"),
                body: Column(
                  children: [
                    Stack(
                      children: [
                        favCon(),
                        Padding(
                            padding: EdgeInsets.only(left: 200.w, top: 40.h),
                            child: Image.asset(
                              AssetsManager.login,
                              width: 200.w,
                            )),
                        ClipPathContainer(),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (favCubit.list.length > 0)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (ctx, index) => doctorCell(
                            context: ctx,
                            doctor: favCubit.list[index],
                            onPressed: () {
                              context.push(
                                AppRouter.kDoctorProfile,
                                extra: {
                                  'doctor': favCubit.list[index],
                                  'cubit': favCubit,
                                },
                              );
                            },
                          ),
                          separatorBuilder: (ctx, index) => const SizedBox(),
                          itemCount: favCubit.list.length,
                        ),
                      )
                  ],
                ));
          },
        ));
  }
}
