import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/color_helper.dart';
import '../utils/style_manager.dart';

PreferredSizeWidget appBarS({
  required String title,
}){
  return AppBar(
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(title, style: StyleManager.fontBold60),
      background: Container(
          color: ColorsHelper.primary), // Solid color, no transparency
    ),
    surfaceTintColor: ColorsHelper.primary,
    backgroundColor: ColorsHelper.primary,
    /*leading: IconButton(
      onPressed: (){},
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorsHelper.white,
      ),
    ),*/
  );
}