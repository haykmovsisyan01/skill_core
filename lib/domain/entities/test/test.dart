import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_core/domain/entities/question/question.dart';

part 'test.freezed.dart';
part 'test.g.dart';

@freezed
@JsonSerializable()
class TestEntity with _$TestEntity {
  @override
  final String title;
  @override
  final String description;
  @override
  final int id;
  @override
  final List<QuestionEntity> questions;

  TestEntity({
    required this.title,
    required this.description,
    required this.id,
    required this.questions,
  });

  factory TestEntity.fromJson(Map<String, dynamic> json) =>
      _$TestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TestEntityToJson(this);
}
