import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.age,
    required this.bloodType,
    required this.gender,
    required this.patientName,
    required this.sessionDate,
    this.height = 160,
  });
  final double height;
  final String patientName;
  final String gender;
  final String age;
  final String bloodType;
  final String sessionDate;
  @override
  Widget build(BuildContext context) {
    double topForImage = ((height / 2) - 40);
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            ColorsHelper.primaryLight,
            ColorsHelper.primary,
            ColorsHelper.primaryDark
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      padding: const EdgeInsets.all(
        AppSize.size20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _patientCardInformationLabel(
                      header: "Patient Name",
                      value: patientName,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _patientCardInformationLabel(
                      header: "Gender",
                      value: gender,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _patientCardInformationLabel(
                      header: "Age",
                      value: age,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.size20,
              ),
              Row(
                children: [
                  Expanded(
                    child: _patientCardInformationLabel(
                        header: "Blood Type", value: bloodType),
                  ),
                  Expanded(
                    child: _patientCardInformationLabel(
                      header: "Session Date",
                      value: sessionDate,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: -20 + topForImage,
            right: -20 - 30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorsHelper.primaryLight,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetsManager.profileImage,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _patientCardInformationLabel(
      {required String header, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          header,
          style: StyleManager.fontRegular14Black.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: StyleManager.fontMedium14,
        )
      ],
    );
  }
}
