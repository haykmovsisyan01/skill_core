import 'package:skill_core/data/models/question_model.dart';
import 'package:skill_core/data/models/test_model.dart';
import 'package:skill_core/domain/entities/firestore/firestore_response.dart';
import 'package:skill_core/domain/repositories/firestore_repository.dart';

class FetchAllTestsUseCase {
  final FireStoreRepository _repository;

  FetchAllTestsUseCase(this._repository);

  Future<FireStoreResponseEntity<List<TestModel>?>> fetchAllTests() async {
    final result = await _repository.fetchTests();

    if (result.data == null) {
      return result.copyWithType();
    }

    final List<TestModel> tests = (result.data)!
        .map(
          (el) => TestModel(
            title: el.title,
            id: el.id,
            description: el.description,
            questions: el.questions
                .map(
                  (el) => Question(
                    question: el.question,
                    answers: el.answers,
                    rightAnswer: el.rightAnswer,
                  ),
                )
                .toSet(),
          ),
        )
        .toList();

    return result.copyWithType<List<TestModel>?>(data: tests);
  }
}
