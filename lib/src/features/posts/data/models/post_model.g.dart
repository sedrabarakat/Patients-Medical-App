// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      authorId: (json['author_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      text: json['text'] as String,
      liked: json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'text': instance.text,
      'image': instance.image,
      'author': instance.author,
      'liked': instance.liked,
    };
