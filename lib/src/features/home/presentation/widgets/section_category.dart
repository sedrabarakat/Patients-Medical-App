import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';

import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/utils/style_manager.dart';

class SectionCategory extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;

  final void Function()? onTap;

  const SectionCategory(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: DimensionsHelper.heightPercentage(context, 4),
          backgroundColor:
              isSelected ? ColorsManager.primary : ColorsManager.white,
          child: IconButton(
              onPressed: onTap,
              icon: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              )),
        ),
        Text(
          title,
          style: isSelected? StyleManager.fontRegular16primary:StyleManager.fontRegular14grey
          // style: StyleManager.fontRegular14Black,
        ),
      ],
    );
  }
}
