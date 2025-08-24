import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/login/login_response.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';
import 'package:skill_core/domain/entities/reg/reg_response.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> login(LoginRequestEntity entity);
  Future<RegResponseEntity> register(RegRequestEntity entity);
  Future<void> signOut();
}
