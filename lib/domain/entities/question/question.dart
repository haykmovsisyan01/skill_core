import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
@JsonSerializable()
class QuestionEntity with _$QuestionEntity {
  final String question;
  final Set<String> answers;
  final String rightAnswer;

  QuestionEntity({
    required this.question,
    required this.answers,
    required this.rightAnswer,
  });

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionEntityToJson(this);
}
