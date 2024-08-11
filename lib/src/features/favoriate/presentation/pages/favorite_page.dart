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
    return Scaffold(
      appBar: appBarS(title: "My Favorite"),
      body: Column(
        children: [
          Stack(
            children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h),
                child: Image.asset(AssetsManager.favorite,)),
            ClipPathContainer(),
          ],),
          Expanded(
            child: ListView.separated(
                itemBuilder: (ctx,index)=>doctorCell(context: ctx),
                separatorBuilder: (ctx,index)=>SizedBox(),
                itemCount: 10),
          )
        ],
      )
    );
  }
}
