import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/widgets/flexible_appbar.dart';

import '../../../../../core/widgets/clip_path_container.dart';
import '../widget/doctor_cell.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>FavCubit(getIt())..getFav(),
      child: BlocConsumer<FavCubit,FavStates>(
        listener: (context,state){},
        builder: (context,state){
          FavCubit favCubit=FavCubit.get(context);
          return Scaffold(
              appBar: appBarS(title: "My Favorite"),
              body: Column(
                children: [
                  Stack(
                    children: [
                      favCon(),
                      Padding(
                        padding: EdgeInsets.only(left: 200.w,top: 40.h),
                          child: Image.asset(AssetsManager.login,width: 200.w,)),
                      ClipPathContainer(),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  if(favCubit.list.length>0)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (ctx, index) => doctorCell(context: ctx,
                            doctor: favCubit.list[index]),
                        separatorBuilder: (ctx, index) => SizedBox(),
                        itemCount: favCubit.list.length),
                  )
                ],
              ));
        },
      )
    );
  }
}
