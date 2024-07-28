import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;

  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.hintText,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsHelper.primary,
      focusNode: _focusNode,
      obscureText: widget.obscureText == null || widget.obscureText == false
          ? false
          : true,
      keyboardType: widget.isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: widget.valid,
      controller: widget.myController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.width / 35),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 100,
          horizontal: MediaQuery.of(context).size.width / 15,
        ),
        labelText: widget.labelText,
        labelStyle: StyleManager.fontRegular14Black,
        floatingLabelStyle: StyleManager.fontRegular14Primary,
        suffixIcon: InkWell(
          onTap: widget.onTapIcon,
          child: Icon(
            widget.iconData,
            color: _focusNode.hasFocus
                ? ColorsHelper.primary
                : ColorsHelper.grey,
          ),
        ),
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
    );
  }
}
