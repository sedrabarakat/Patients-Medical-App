// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      commentableType: json['commentable_type'] as String,
      commentableId: (json['commentable_id'] as num).toInt(),
      text: json['text'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'commentable_type': instance.commentableType,
      'commentable_id': instance.commentableId,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'author': instance.author,
    };
