import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeHelper{

  static String Convert_Time_HM({
    required TimeOfDay Time
  }){
    String hours = Time.hour.toString().padLeft(2, '0');
    String minutes = Time.minute.toString().padLeft(2, '0');
    String HH_MM="$hours:$minutes";
    return HH_MM;
  }

  static List<String> splitTime({
    required String time
}) {
    List<String> times = time.split('-');
    return times;
  }
}