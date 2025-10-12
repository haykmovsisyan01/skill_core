import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skill_core/data/exceptions.dart';
import 'package:skill_core/data/repositories/auth_repository_impl.dart';
import 'package:skill_core/data/sources/remote/firebase_auth_client.dart';
import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/login/login_response.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';
import 'package:skill_core/domain/entities/reg/reg_response.dart';
import 'package:skill_core/domain/entities/sign_out/sign_out.dart';

class MockFirebaseClient extends Mock implements FirebaseAuthClient {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  group('Test auth repository', () {
    late FirebaseAuthClient mockFirebaseClient;
    late UserCredential mockUserCredential;
    late AuthRepositoryImpl authRepositoryImpl;

    final String email = 'test1234@gmail.com';
    final String password = 'test1234';

    group('Test auth repository login', () {
      mockFirebaseClient = MockFirebaseClient();
      mockUserCredential = MockUserCredential();
      authRepositoryImpl = AuthRepositoryImpl(mockFirebaseClient);

      test('Test login success', () async {
        final LoginRequestEntity loginRequestEntity = LoginRequestEntity(
          email: email,
          password: password,
        );
        final LoginResponseEntity loginResponseEntity = LoginResponseEntity(
          failed: false,
          message: '',
        );

        when(
          () =>
              mockFirebaseClient.loginWithEmailAndPassword(loginRequestEntity),
        ).thenAnswer((_) async => mockUserCredential);

        final result = await authRepositoryImpl.login(loginRequestEntity);

        expect(result.failed, loginResponseEntity.failed);
      });
      test('Test login failed', () async {
        final LoginRequestEntity loginRequestEntity = LoginRequestEntity(
          email: email,
          password: password,
        );
        final LoginResponseEntity loginResponseEntity = LoginResponseEntity(
          failed: true,
          message: '',
        );

        final AuthException exception = AuthException(
          message: 'Smt went wrong',
        );

        when(
          () =>
              mockFirebaseClient.loginWithEmailAndPassword(loginRequestEntity),
        ).thenThrow(exception);

        final result = await authRepositoryImpl.login(loginRequestEntity);

        expect(result.failed, loginResponseEntity.failed);
      });
    });
    group('Test auth repository reg', () {
      mockFirebaseClient = MockFirebaseClient();
      mockUserCredential = MockUserCredential();
      authRepositoryImpl = AuthRepositoryImpl(mockFirebaseClient);

      test('Test reg success', () async {
        final RegRequestEntity regRequestEntity = RegRequestEntity(
          email: email,
          password: password,
        );
        final RegResponseEntity regResponseEntity = RegResponseEntity(
          failed: false,
          message: '',
        );

        when(
          () =>
              mockFirebaseClient.registerWithEmailAndPassword(regRequestEntity),
        ).thenAnswer((_) async => mockUserCredential);

        final result = await authRepositoryImpl.register(regRequestEntity);

        expect(result.failed, regResponseEntity.failed);
      });
      test('Test reg failed', () async {
        final RegRequestEntity regRequestEntity = RegRequestEntity(
          email: email,
          password: password,
        );
        final RegResponseEntity regResponseEntity = RegResponseEntity(
          failed: true,
          message: '',
        );
        final AuthException exception = AuthException(
          message: 'Smt went wrong',
        );
        when(
          () =>
              mockFirebaseClient.registerWithEmailAndPassword(regRequestEntity),
        ).thenThrow(exception);

        final result = await authRepositoryImpl.register(regRequestEntity);

        expect(result.failed, regResponseEntity.failed);
      });
    });
    group('Test auth repository signOut', () {
      mockFirebaseClient = MockFirebaseClient();
      mockUserCredential = MockUserCredential();
      authRepositoryImpl = AuthRepositoryImpl(mockFirebaseClient);

      test('Test signOut success', () async {
        final SignOutEntity signOutEntity = SignOutEntity(
          failed: false,
          message: '',
        );

        when(
          () => mockFirebaseClient.signOut(),
        ).thenAnswer((_) async => mockUserCredential);

        final result = await authRepositoryImpl.signOut();

        expect(result.failed, signOutEntity.failed);
      });
      test('Test signOut failed', () async {
        final SignOutEntity signOutEntity = SignOutEntity(
          failed: true,
          message: '',
        );

        final AuthException exception = AuthException(
          message: 'Smt went wrong',
        );

        when(() => mockFirebaseClient.signOut()).thenThrow(exception);

        final result = await authRepositoryImpl.signOut();

        expect(result.failed, signOutEntity.failed);
      });
    });
  });
}
