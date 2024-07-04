import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const DefaultButton({super.key,
    required this.text,
    this.onPressed,
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 2),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed ,
        color: color,
        textColor: ColorsManager.white,
        child: Text(text, style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),),
      ),
    );
  }
}