// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestEntity _$TestEntityFromJson(Map<String, dynamic> json) => TestEntity(
  title: json['title'] as String,
  description: json['description'] as String,
  id: (json['id'] as num).toInt(),
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TestEntityToJson(TestEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'questions': instance.questions,
    };
