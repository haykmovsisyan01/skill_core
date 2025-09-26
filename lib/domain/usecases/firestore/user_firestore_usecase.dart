import 'package:skill_core/data/models/user_model.dart';
import 'package:skill_core/domain/entities/firestore/firestore_response.dart';
import 'package:skill_core/domain/entities/user/user.dart';
import 'package:skill_core/domain/repositories/firestore_repository.dart';

class UserFireStoreUseCase {
  final FireStoreRepository repository;

  UserFireStoreUseCase(this.repository);

  Future<FireStoreResponseEntity> changeUserOptions(
    String uid,
    UserEntity newOptions,
  ) async {
    return await repository.changeUser(uid, newOptions);
  }

  Future<FireStoreResponseEntity> addUser(String uid, UserEntity user) async {
    return await repository.addUser(uid, user);
  }

  Future<FireStoreResponseEntity<AppUser>> fetchUser(String uid) async {
    final result = await repository.fetchUser(uid);

    return result.copyWithType<AppUser>(data: AppUser.fromApi(result.data!));
  }
}
