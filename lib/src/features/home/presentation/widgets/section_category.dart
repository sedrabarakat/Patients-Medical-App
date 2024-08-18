import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';

import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';

class SectionCategory extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;

  final void Function()? onTap;

  const SectionCategory({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: DimensionsHelper.heightPercentage(context, 4),
          backgroundColor:
              isSelected ? ColorsHelper.primary : ColorsHelper.white,
          child: IconButton(
              onPressed: onTap,
              icon: network_image_widget( image: imageUrl)
        ),),
        Text(title,
            style: isSelected
                ? StyleManager.fontRegular16primary
                : StyleManager.fontRegular14grey
            // style: StyleManager.fontRegular14Black,
            ),
      ],
    );
  }
}
