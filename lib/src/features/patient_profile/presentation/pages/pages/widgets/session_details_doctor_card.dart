import 'package:flutter/material.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class SessionDetailsDoctorCard extends StatelessWidget {
  const SessionDetailsDoctorCard({
    super.key,
    required this.doctor,
  });
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.size10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
          bottom: BorderSide(color: ColorsHelper.primary, width: 2),
        ),
      ),
      child: Text(
        "Doctor Name : ${doctor.user.fullName}",
        style: StyleManager.fontMedium14.copyWith(color: Colors.black),
      ),
    );
  }
}
