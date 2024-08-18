import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeHelper {
  static String Convert_Time_HM({required TimeOfDay Time}) {
    String hours = Time.hour.toString().padLeft(2, '0');
    String minutes = Time.minute.toString().padLeft(2, '0');
    String HH_MM = "$hours:$minutes";
    return HH_MM;
  }

  static List<String> splitTime({required String time}) {
    List<String> times = time.split('-');
    return times;
  }

  static String dateFormat({required DateTime date}) {
    String formatteddate = DateFormat('yyyy-MM-dd').format(date);
    return formatteddate;
  }

  static String getDayOfWeek({required DateTime date}) {
    String dayOfWeek = DateFormat('EEEE').format(date);
    dayOfWeek = dayOfWeek[0].toUpperCase() + dayOfWeek.substring(1);
    return dayOfWeek;
  }

  static List<String> timeStampToLocal(int timeStamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000).toUtc();
    String formattedTime = DateFormat('h:mm a').format(dateTime.toLocal());
    List<String> timeComponents = formattedTime.split(':');
    timeComponents.insertAll(1, timeComponents[1].split(' '));
    timeComponents.removeLast();
    return timeComponents;
  }
}
