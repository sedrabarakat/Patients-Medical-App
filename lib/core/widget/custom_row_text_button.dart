
import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class CustomRowTextButton extends StatelessWidget {
  const CustomRowTextButton({
    super.key,
    required this.text,
    required this.btnText,
    required this.onTap,
  });

  final String text;
  final String btnText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: StyleManager.fontRegular14Black,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            btnText,
            style: StyleManager.fontRegular14Primary,
          ),
        ),
      ],
    );
  }
}
