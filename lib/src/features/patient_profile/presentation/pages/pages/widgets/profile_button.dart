import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });
  final void Function()? onTap;
  final String label;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSize.size10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorsHelper.lightestGrey,
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: StyleManager.fontMedium14.copyWith(
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorsHelper.lighGrey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
