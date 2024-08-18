import 'package:json_annotation/json_annotation.dart';

import 'doctor_model.dart';
part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final int id;
  @JsonKey(name: 'name')
  final String sectionName;
  @JsonKey(readValue: imageValue)
  final String image;
  final List<DoctorModel>? doctor;
  final List<SectionService>? service;
  SectionModel({
    required this.id,
    required this.sectionName,
    required this.image,
    this.service,
    this.doctor,
  });
  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
  //! I made this function because sometimes the image return as a boolean value
  static imageValue(map, string) {
    if (map['image'] is bool && !map['image']) {
      return '00';
    } else if (map['image'] is bool) {
      return '10';
    }
    return map['image'];
  }
}

@JsonSerializable()
class SectionService {
  final int id;
  final String name;
  final String price;
  SectionService({
    required this.name,
    required this.price,
    required this.id,
  });
  factory SectionService.fromJson(Map<String, dynamic> json) =>
      _$SectionServiceFromJson(json);
  Map<String, dynamic> toJson() => _$SectionServiceToJson(this);
}
