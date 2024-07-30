import 'package:flutter/material.dart';
import 'package:patient_app/src/features/home/data/model/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset(
            doctor.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(doctor.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.specialty),
          ],
        ),
      ),
    );
  }
}
