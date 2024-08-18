import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';

PreferredSizeWidget appBar({
  required String title,
  IconData? leadingIcon,
  void Function()? onLeadingPressed,
}) {
  return AppBar(
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(top: 10.h),
      centerTitle: true,

      title: Text(title, style: StyleManager.fontBold60),
      background: Container(
          color: ColorsHelper.primary), // Solid color, no transparency
    ),
    surfaceTintColor: ColorsHelper.primary,
    backgroundColor: ColorsHelper.primary,
    leading: leadingIcon != null
        ? IconButton(
            onPressed: onLeadingPressed,
            icon: Icon(
              leadingIcon,
              color: Colors.white,
              size: 28,
            ),
          )
        : null,
  );
}
