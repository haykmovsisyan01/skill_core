// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideEntity _$GuideEntityFromJson(Map<String, dynamic> json) => GuideEntity(
  title: json['title'] as String,
  id: (json['id'] as num).toInt(),
  author: json['author'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$GuideEntityToJson(GuideEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
    };
