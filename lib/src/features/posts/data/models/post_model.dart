import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/core/data/models/user_model.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final int id;
  @JsonKey(name: 'author_id')
  final int authorId;
  final String text;
  final String image;
  final UserModel author;
  bool liked;
  PostModel({
    required this.author,
    required this.authorId,
    required this.id,
    required this.image,
    required this.text,
    this.liked = false,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
