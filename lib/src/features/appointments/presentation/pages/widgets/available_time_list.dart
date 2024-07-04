import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/time_tile.dart';

class AvailableTimeList extends StatefulWidget {
  const AvailableTimeList({
    super.key,
    required this.length,
    this.numberOfColumn = 4,
  });
  final int numberOfColumn;
  final int length;

  @override
  State<AvailableTimeList> createState() => _AvailableTimeListState();
}

class _AvailableTimeListState extends State<AvailableTimeList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: AppMargin.m10,
        spacing: AppMargin.m10,
        children: List.generate(widget.length, (index) {
          double width = DimensionsHelper.widthPercentage(context, 100) -
              AppPadding.appPadding.horizontal -
              (AppMargin.m10 * widget.numberOfColumn);

          return TimeTile(
            isSelected: selectedIndex == index,
            width: width * (1 / widget.numberOfColumn),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }),
        // clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
