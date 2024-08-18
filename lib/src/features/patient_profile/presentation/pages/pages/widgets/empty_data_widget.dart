import 'package:flutter/material.dart';

import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/widgets/custom_button.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    required this.label,
    this.buttonPressed,
  });
  final String label;
  final void Function()? buttonPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        // color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.noData,
              width: DimensionsHelper.widthPercentage(context, 70),
              fit: BoxFit.fitWidth,
            ),
            buttonPressed == null
                ? Text(
                    label,
                    style: StyleManager.fontRegular18primary.copyWith(
                      color: Colors.black,
                    ),
                  )
                : CustomButton(
                    onPressed: buttonPressed!,
                    label: label,
                  ),
          ],
        ),
      ),
    );
  }
}
