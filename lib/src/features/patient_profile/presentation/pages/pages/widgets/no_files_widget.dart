import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/assets_manager.dart';

class NoFilesWidget extends StatelessWidget {
  const NoFilesWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              AssetsManager.noData,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
