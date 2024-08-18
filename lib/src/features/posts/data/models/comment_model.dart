import 'package:json_annotation/json_annotation.dart';
import 'package:patient_app/core/data/models/user_model.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'commentable_type')
  final String commentableType;
  @JsonKey(name: 'commentable_id')
  final int commentableId;
  final String text;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final UserModel author;

  Comment({
    required this.id,
    required this.userId,
    required this.commentableType,
    required this.commentableId,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
