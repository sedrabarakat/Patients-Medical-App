import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/helper/file_helper.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/download_cubit_state.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/upload_download_cubit.dart';

class FileCard extends StatelessWidget {
  const FileCard({
    super.key,
    required this.onDownloadPressed,
    required this.fileData,
  });
  final void Function()? onDownloadPressed;

  final FileModel fileData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsManager.pdf,
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: AppSize.size10,
          ),
          Text(
            fileData.fileType,
            style: StyleManager.fontMedium16White.copyWith(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          BlocBuilder<DownloadCubit, DownloadCubitState>(
            builder: (context, state) {
              if (state is DownloadingFileState &&
                  state.fileId == fileData.id) {
                return CircularProgressIndicator(
                  color: ColorsHelper.primary,
                  value: state.value,
                );
              } else {
                return TextButton(
                  onPressed: fileData.downloaded
                      ? () async {
                          FileHelper.openFile(
                              fileData.path, fileData.id, fileData.fileType);
                        }
                      : onDownloadPressed,
                  child: Text(
                    fileData.downloaded ? "Open" : "Download",
                    style: StyleManager.fontMedium13.copyWith(
                      color: ColorsHelper.primary,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
