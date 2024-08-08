import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:progress_state_button/progress_button.dart';

class CustomStateButton extends StatelessWidget {
  const CustomStateButton({
    super.key,
    required this.onPressed,
    required this.currentState,
    required this.label,
    this.width = double.infinity,
    this.loadingWidth = double.infinity,
    this.height = 44,
  });
  final String label;
  final Function? onPressed;
  final ButtonState currentState;
  final double width;
  final double loadingWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ProgressButton(
      radius: 10,
      minWidth: double.infinity,
      maxWidth: double.infinity,
      height: height,
      progressIndicatorAlignment: MainAxisAlignment.center,
      stateWidgets: {
        ButtonState.idle: Text(
          label,
          style: StyleManager.fontMedium14,
        ),
        ButtonState.loading: const SizedBox(),
        ButtonState.fail: Text(
          "Fail",
          style: StyleManager.fontMedium14,
        ),
        ButtonState.success: Text(
          "Success",
          style: StyleManager.fontMedium14,
        )
      },
      stateColors: {
        ButtonState.idle: ColorsHelper.primary,
        ButtonState.loading: ColorsHelper.primary,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400
      },
      state: currentState,
      onPressed: onPressed,
    );
  }
}
