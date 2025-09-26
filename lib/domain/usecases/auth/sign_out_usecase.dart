import 'package:skill_core/domain/entities/sign_out/sign_out.dart';

import '../../repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<SignOutEntity> signOut() async {
    return await _repository.signOut();
  }
}
