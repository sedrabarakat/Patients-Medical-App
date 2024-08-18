import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';
import 'package:patient_app/src/features/appointments/data/models/appointment_day_date_model.dart';
import 'package:patient_app/src/features/appointments/presentation/cubit/appointment_cubit.dart';
import 'package:patient_app/src/features/appointments/presentation/pages/widgets/time_tile.dart';

class AvailableTimeList extends StatefulWidget {
  const AvailableTimeList({
    super.key,
    this.numberOfColumn = 4,
    required this.appointment,
    required this.onTimeSelected,
  });
  final int numberOfColumn;
  final AppointmentDayDateModel appointment;
  final void Function(String) onTimeSelected;

  @override
  State<AvailableTimeList> createState() => _AvailableTimeListState();
}

class _AvailableTimeListState extends State<AvailableTimeList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<AppointmentCubit>(context).startMin == null) {
      setState(() {
        selectedIndex = -1;
      });
    }
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: AppMargin.m10,
        spacing: AppMargin.m10,
        children:
            List.generate(widget.appointment.availableTimes.length, (index) {
          double width = DimensionsHelper.widthPercentage(context, 100) -
              AppPadding.appPadding.horizontal -
              (AppMargin.m10 * widget.numberOfColumn);

          return TimeTile(
            time: widget.appointment.availableTimes[index],
            isSelected: selectedIndex == index,
            width: width * (1 / widget.numberOfColumn),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTimeSelected(widget.appointment.availableTimes[index]);
            },
          );
        }),
      ),
    );
  }
}
