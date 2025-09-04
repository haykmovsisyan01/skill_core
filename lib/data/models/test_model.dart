import 'package:skill_core/data/models/question_model.dart';
import 'package:skill_core/data/models/result_model.dart';

class TestModel {
  final String title;
  final String description;
  final String id;
  final Set<Question> questions;
  final Result? result;

  TestModel({
    required this.title,
    required this.description,
    required this.id,
    required this.questions,
    this.result,
  });

  TestModel copyWith(
    String? title,
    String? description,
    String? id,
    Set<Question>? questions,
    Result? result,
  ) => TestModel(
    title: title ?? this.title,
    description: description ?? this.description,
    id: id ?? this.id,
    questions: questions ?? this.questions,
    result: result,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
