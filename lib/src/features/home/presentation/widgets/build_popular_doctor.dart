import 'package:flutter/material.dart';

import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../data/model/doctor.dart';
import 'doctor_card.dart';

Widget buildPopularDoctors(List<Doctor> doctors) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Doctors",
            style: StyleManager.fontBold16Black,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              AppString.seeAll,
            ),
          ),
        ],
      ),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => DoctorCard(
          doctor: doctors[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: doctors.length,
        shrinkWrap: true,
      ),
    ],
  );
}
