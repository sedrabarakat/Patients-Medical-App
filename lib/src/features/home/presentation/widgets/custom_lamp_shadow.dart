
import 'package:flutter/material.dart';

class CustomLampShadow extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomLampShadow({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 8,
          ),
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 12,
          ),
        ],
      ),
    );
  }
}