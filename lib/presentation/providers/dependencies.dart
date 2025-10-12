import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/data/repositories/auth_repository_impl.dart';
import 'package:skill_core/data/repositories/firestore_repository_impl.dart';
import 'package:skill_core/data/sources/remote/firebase_auth_client.dart';
import 'package:skill_core/data/sources/remote/firebase_firestore_client.dart';
import 'package:skill_core/domain/repositories/auth_repository.dart';
import 'package:skill_core/domain/repositories/firestore_repository.dart';
import 'package:skill_core/domain/usecases/auth/login_usecase.dart';
import 'package:skill_core/domain/usecases/auth/register_usecase.dart';
import 'package:skill_core/domain/usecases/auth/sign_out_usecase.dart';
import 'package:skill_core/domain/usecases/firestore/fetch_all_guides_usecase.dart';
import 'package:skill_core/domain/usecases/firestore/fetch_all_tests_usecase.dart';
import 'package:skill_core/domain/usecases/firestore/user_firestore_usecase.dart';

import '../../data/sources/local/shared_preferences.dart';
import '../../domain/usecases/auth/send_password_reset_email_usecase.dart';
import '../../domain/usecases/local/shared_pref_usecase.dart';

final firebaseClientProvider = Provider<FirebaseAuthClient>(
  (ref) => FirebaseAuthClient(FirebaseAuth.instance),
);

final fireStoreClientProvider = Provider<FirebaseFireStoreClient>(
  (ref) => FirebaseFireStoreClient(FirebaseFirestore.instance),
);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseClient = ref.watch(firebaseClientProvider);
  return AuthRepositoryImpl(firebaseClient);
});

final fireStoreRepositoryProvider = Provider<FireStoreRepository>((ref) {
  final fireStoreClient = ref.watch(fireStoreClientProvider);

  return FireStoreRepositoryImpl(fireStoreClient);
});

/// Authentication UseCases
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

/// FireStore UseCases
final fetchAllGuidesUseCase = Provider((ref) {
  final repository = ref.watch(fireStoreRepositoryProvider);
  return FetchAllGuidesUseCase(repository);
});

final fetchAllTestsUseCase = Provider((ref) {
  final repository = ref.watch(fireStoreRepositoryProvider);
  return FetchAllTestsUseCase(repository);
});

final userFireStoreUseCase = Provider((ref) {
  final repository = ref.watch(fireStoreRepositoryProvider);
  return UserFireStoreUseCase(repository);
});

final sharedPreferencesUseCase = Provider((ref) {
  return SharedPrefUseCase(preferences: preferences);
});
