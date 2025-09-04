import 'package:skill_core/domain/repositories/auth_repository.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepository _repository;

  SendPasswordResetEmailUseCase(this._repository);

  Future<void> sendPasswordResetEmail(String email) async {
    await _repository.sendPasswordResetEmail(email);
  }
}
