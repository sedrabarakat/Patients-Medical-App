import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/string_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.values,
    required this.onChanged,
    this.hintText,
  });

  final String? hintText;
  final String labelText;
  final String initialValue;
  final List<String> values;
  final void Function(String?)? onChanged;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 35,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: DimensionsHelper.screenHeight(context) / 100,
          horizontal: DimensionsHelper.screenWidth(context) / 15,
        ),
        labelText: widget.labelText,
        floatingLabelStyle: StyleManager.fontRegular14Primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: ColorsHelper.primary,
            width: 2,
          ),
        ),
      ),
      value: selectedValue ?? widget.initialValue,
      items: widget.values.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        widget.onChanged!(value);
        setState(() {
          selectedValue = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty || value == 'None') {
          return AppString.textFieldMaritalStatusHint;
        }
        return null;
      },
    );
  }
}
