import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/data/repositories/auth_repository_impl.dart';
import 'package:skill_core/data/sources/remote/firebase_client.dart';
import 'package:skill_core/domain/repositories/auth_repository.dart';
import 'package:skill_core/domain/usecases/login_usecase.dart';
import 'package:skill_core/domain/usecases/register_usecase.dart';
import 'package:skill_core/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:skill_core/domain/usecases/sign_out_usecase.dart';

final firebaseClientProvider = Provider<FirebaseClient>(
  (ref) => FirebaseClient(FirebaseAuth.instance),
);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseClient = ref.watch(firebaseClientProvider);
  return AuthRepositoryImpl(firebaseClient);
});

final regUseCase = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

final loginUseCase = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final signOutUseCase = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return SignOutUseCase(repository);
});

final sendPasswordResetEmailUseCase = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return SendPasswordResetEmailUseCase(repository);
});
