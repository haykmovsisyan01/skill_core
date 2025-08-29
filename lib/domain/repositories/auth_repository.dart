import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/login/login_response.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';
import 'package:skill_core/domain/entities/reg/reg_response.dart';
import 'package:skill_core/domain/entities/sign_out/sign_out.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> login(LoginRequestEntity entity);
  Future<RegResponseEntity> register(RegRequestEntity entity);
  Future<SignOutEntity> signOut();
}
