import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/icon_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/utils/values_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    super.key,
  });

  @override
  State<CustomCalender> createState() => _MyCalenderState();
}

class _MyCalenderState extends State<CustomCalender> {
  DateTime selectedDay = DateTime.now();
  final BoxDecoration _buildBoxDecoration = const BoxDecoration(
    shape: BoxShape.rectangle,
  );
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: AppLocalizations.of(context)!.localeName,
      weekendDays: const [DateTime.saturday, DateTime.friday],
      currentDay: selectedDay,
      daysOfWeekHeight: 52,
      rowHeight: 52,
      headerStyle: HeaderStyle(
        headerMargin: const EdgeInsets.only(
          bottom: 5,
        ),
        formatButtonVisible: false,
        titleCentered: true,
        titleTextFormatter: (date, locale) => DateFormat('MMMM').format(date),
        titleTextStyle: StyleManager.fontBold16Black,
        leftChevronIcon: IconManager.arrowBackIcon,
        rightChevronIcon: IconManager.arrowForwardIcon,
        leftChevronMargin: const EdgeInsets.all(0),
        leftChevronPadding: const EdgeInsets.only(
          left: AppPadding.p10,
        ),
        rightChevronMargin: const EdgeInsets.all(0),
        rightChevronPadding: const EdgeInsets.only(
          right: AppPadding.p10,
        ),
      ),
      focusedDay: selectedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(
        DateTime.now().year,
        DateTime.now().month + 1,
        DateTime.now().day + 30,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) => DateFormat('EE').format(date)[0],
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: ColorsManager.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        defaultDecoration: _buildBoxDecoration,
        selectedDecoration: _buildBoxDecoration,
        markerDecoration: _buildBoxDecoration,
        holidayDecoration: _buildBoxDecoration,
        outsideDecoration: _buildBoxDecoration,
        weekendDecoration: _buildBoxDecoration,
        rangeEndDecoration: _buildBoxDecoration,
        rowDecoration: _buildBoxDecoration,
        withinRangeDecoration: _buildBoxDecoration,
        disabledDecoration: _buildBoxDecoration,
        rangeStartDecoration: _buildBoxDecoration,
        todayTextStyle: StyleManager.fontExtraBold14White,
        weekendTextStyle: StyleManager.fontRegular14grey,
        defaultTextStyle: StyleManager.fontExtraBold14Black,
      ),
      onDaySelected: (currentDay, toDay) {
        setState(() {
          selectedDay = toDay;
        });
      },
    );
  }
}
