import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';

import 'package:patient_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_state.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/file_card.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/session_details_doctor_card.dart';

class ListOfFiles extends StatelessWidget {
  const ListOfFiles({
    super.key,
    required this.files,
    required this.sessionDetailsId,
    required this.doctor,
  });
  final List<FileModel> files;
  final int sessionDetailsId;
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        return Column(
          children: [
            SessionDetailsDoctorCard(
              doctor: doctor,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSize.screenPadding),
                itemBuilder: (context, index) {
                  return FileCard(
                    fileData: files[index],
                    onDownloadPressed: () {
                      BlocProvider.of<PatientCubit>(context)
                          .downloadAndSaveFile(
                        files[index].path,
                        context,
                        files[index].id,
                        files[index].fileType,
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppSize.size10,
                ),
                itemCount: files.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
