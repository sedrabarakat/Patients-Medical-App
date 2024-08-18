import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class SettingButton extends StatelessWidget {
  const SettingButton(
      {super.key,
      required this.leadingIcon,
      required this.label,
      this.actionIcon,
      required this.onTap});
  final IconData leadingIcon;
  final String label;
  final IconData? actionIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.black12,
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsHelper.primary,
            child: Icon(
              leadingIcon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: StyleManager.fontMedium14.copyWith(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          actionIcon != null
              ? const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
