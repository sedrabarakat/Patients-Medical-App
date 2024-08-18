import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/home/data/model/slider_model.dart';

import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/widgets/image_widget.dart';

class FeaturedDoctor extends StatelessWidget {
  final SliderModel slider;

  const FeaturedDoctor({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsHelper.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: AppPadding.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(slider.title, style: StyleManager.fontBold24Black),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: network_image_widget( image: slider.image,)
          ),
        ],
      ),
    );
  }
}
