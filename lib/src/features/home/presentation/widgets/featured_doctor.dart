import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

import '../../../../../core/utils/padding_manager.dart';
import '../../data/model/doctor.dart';

class FeaturedDoctor extends StatelessWidget {
  final Doctor doctor;

  const FeaturedDoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:AppPadding.only(left: 20,top: 20) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: StyleManager.fontBold24Black),
                Text(doctor.specialty),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight ,
            child: Image.asset(
              //this image will become from doctor model, this now just for testing
              'assets/images/doctor.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
