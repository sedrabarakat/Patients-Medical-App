import 'package:flutter/material.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';

import '../../../../../core/widgets/image_widget.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: network_image_widget(image: doctor.user.image),
        ),
        title: Text('${doctor.user.firstName} ${doctor.user.lastName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.section!.sectionName),
          ],
        ),
      ),
    );
  }
}
