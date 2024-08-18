import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorsHelper.lighGrey,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: StyleManager.fontMedium14.copyWith(
            fontSize: 14,
            color: ColorsHelper.lighGrey,
          ),
        ),
      ],
    );
  }
}
