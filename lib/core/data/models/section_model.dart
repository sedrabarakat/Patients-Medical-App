import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final int id;
  @JsonKey(name: 'name')
  final String sectionName;
  final String image;
  SectionModel({
    required this.id,
    required this.image,
    required this.sectionName,
  });
  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}
