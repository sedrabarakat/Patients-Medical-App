import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChanged,
    required this.label,
  });
  final void Function(bool?)? onChanged;
  final String label;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: currentValue,
          onChanged: (value) {
            setState(() {
              currentValue = value!;
              widget.onChanged!(value);
            });
          },
          activeColor: ColorsHelper.primary,
        ),
        Text(
          widget.label,
          style: StyleManager.fontRegular14Black,
        ),
      ],
    );
  }
}
