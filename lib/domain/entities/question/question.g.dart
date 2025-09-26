// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionEntity _$QuestionEntityFromJson(Map<String, dynamic> json) {
  return QuestionEntity(
    question: json['question'] as String,
    answers: (json['answers'] as List<dynamic>).map((e) => e as String).toSet(),
    rightAnswer: json['right_answer'] as String,
  );
}

Map<String, dynamic> _$QuestionEntityToJson(QuestionEntity instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers.toList(),
      'right_answer': instance.rightAnswer,
    };
