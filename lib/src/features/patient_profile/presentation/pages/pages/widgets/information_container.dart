import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({
    super.key,
    required this.label,
    required this.fields,
  });
  final String label;
  final List<Widget> fields;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(AppSize.size20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSize.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: StyleManager.fontBold18.copyWith(
                color: ColorsHelper.black,
              ),
            ),
            const SizedBox(
              height: AppSize.size10,
            ),
            ...List.generate(
              fields.length,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  fields[index],
                  const SizedBox(
                    height: AppSize.size10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
