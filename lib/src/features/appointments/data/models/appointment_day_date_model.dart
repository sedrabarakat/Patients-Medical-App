import 'package:json_annotation/json_annotation.dart';
part 'appointment_day_date_model.g.dart';

@JsonSerializable()
class AppointmentDayDateModel {
  final String date;
  final String day;
  @JsonKey(name: 'available_times')
  final List<String> availableTimes;
  AppointmentDayDateModel({
    required this.availableTimes,
    required this.date,
    required this.day,
  });
  factory AppointmentDayDateModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDayDateModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentDayDateModelToJson(this);
}
