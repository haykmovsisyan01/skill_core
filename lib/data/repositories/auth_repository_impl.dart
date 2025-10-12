import 'package:skill_core/data/exceptions.dart';
import 'package:skill_core/data/sources/remote/firebase_auth_client.dart';
import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/login/login_response.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';
import 'package:skill_core/domain/entities/reg/reg_response.dart';
import 'package:skill_core/domain/entities/token/token.dart';
import 'package:skill_core/domain/repositories/auth_repository.dart';

import '../../domain/entities/sign_out/sign_out.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<RegResponseEntity> register(RegRequestEntity entity) async {
    try {
      final response = await client.registerWithEmailAndPassword(entity);

      return RegResponseEntity(
        message: 'User has been created.',
        uid: response.user!.uid,
        failed: false,
      );
    } on AuthException catch (e) {
      return RegResponseEntity(message: e.message, failed: true);
    }
  }

  @override
  Future<LoginResponseEntity> login(LoginRequestEntity entity) async {
    try {
      final response = await client.loginWithEmailAndPassword(entity);

      /// Using user.uid as a token
      return LoginResponseEntity(
        message: 'Login success.',
        token: TokenEntity(token: response.user!.uid),
        failed: false,
      );
    } on AuthException catch (e) {
      return LoginResponseEntity(message: e.message, failed: true);
    }
  }

  @override
  Future<SignOutEntity> signOut() async {
    try {
      await client.signOut();
      return SignOutEntity(message: 'Sign out!', failed: false);
    } on AuthException catch (e) {
      return SignOutEntity(message: e.message, failed: true);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await client.sendPasswordResetEmail(email);
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
