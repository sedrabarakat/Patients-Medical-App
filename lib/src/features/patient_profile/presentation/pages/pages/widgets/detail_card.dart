import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.icon,
    required this.content,
    required this.iconColor,
    required this.label,
  });
  final Color iconColor;
  final IconData icon;
  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: DimensionsHelper.heightPercentage(context, 13),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.size15,
        horizontal: AppSize.size10,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                label.toUpperCase(),
                style: StyleManager.fontMedium18,
              ),
              const Spacer(),
              Icon(
                icon,
                size: 22,
                color: iconColor,
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.size15,
          ),
          content,
        ],
      ),
    );
  }
}
