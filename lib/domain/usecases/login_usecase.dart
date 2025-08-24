import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/login/login_response.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<LoginResponseEntity> login(LoginRequestEntity entity) async {
    return _repository.login(entity);
  }
}
