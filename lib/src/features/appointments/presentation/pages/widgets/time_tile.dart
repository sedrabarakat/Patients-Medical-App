import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';

class TimeTile extends StatelessWidget {
  const TimeTile({
    super.key,
    this.width = 80,
    required this.isSelected,
    required this.onTap,
  });
  final double width;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.primary
              : ColorsManager.lighGrey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "10 - 11",
            style: StyleManager.fontMedium16White.copyWith(
              color: isSelected ? ColorsManager.white : ColorsManager.black,
            ),
          ),
        ),
      ),
    );
  }
}
