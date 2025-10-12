import 'package:skill_core/data/models/guide_model.dart';
import 'package:skill_core/domain/entities/firestore/firestore_response.dart';
import 'package:skill_core/domain/entities/guide/guide.dart';
import 'package:skill_core/domain/repositories/firestore_repository.dart';

class FetchAllGuidesUseCase {
  final FireStoreRepository _repository;

  FetchAllGuidesUseCase(this._repository);

  Future<FireStoreResponseEntity<List<GuideModel>?>> fetchAllGuides() async {
    final result = await _repository.fetchGuides();

    if (result.data == null) {
      return result.copyWithType();
    }

    final List<GuideModel> guides = ((result.data) as List<GuideEntity>)
        .map(
          (el) => GuideModel(
            title: el.title,
            id: el.id,
            author: el.author,
            content: el.content,
          ),
        )
        .toList();

    return result.copyWithType<List<GuideModel>?>(data: guides);
  }
}
