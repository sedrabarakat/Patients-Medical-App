import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final int id;
  final String name;
  final String description;
  final String price;
  @JsonKey(name: 'section_id')
  final int sectionId;
  ServiceModel(
      {required this.description,
      required this.id,
      required this.name,
      required this.price,
      required this.sectionId});
  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
