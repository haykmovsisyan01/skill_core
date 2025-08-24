import 'package:skill_core/domain/entities/reg/reg_request.dart';
import 'package:skill_core/domain/entities/reg/reg_response.dart';

import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<RegResponseEntity> register(RegRequestEntity entity) async {
    return _repository.register(entity);
  }
}
