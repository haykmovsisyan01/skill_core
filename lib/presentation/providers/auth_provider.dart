import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/presentation/providers/dependencies.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/reg/reg_request.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(),
);

class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  FutureOr<AuthState> build() {
    return AuthState(message: 'Initial state', failed: false);
  }

  Future<void> register(String email, String password) async {
    state = AsyncValue.loading();
    final useCase = ref.read(regUseCase);

    final entity = await useCase.register(
      RegRequestEntity(email: email, password: password),
    );

    if (!entity.failed) {
      state = AsyncValue.data(
        AuthState(message: entity.message, failed: entity.failed),
      );
    } else {
      state = AsyncValue.error(
        AuthState(message: entity.message, failed: entity.failed),
        StackTrace.current,
      );
    }
  }

  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    final useCase = ref.read(loginUseCase);

    final entity = await useCase.login(
      LoginRequestEntity(email: email, password: password),
    );

    if (!entity.failed) {
      state = AsyncValue.data(
        AuthState(
          message: entity.message,
          failed: entity.failed,
          user: AppUser.fromApi(
            ref.read(firebaseClientProvider).firebase.currentUser!,
          ),
        ),
      );
    } else {
      state = AsyncValue.error(
        AuthState(message: entity.message, failed: entity.failed),
        StackTrace.current,
      );
    }
  }

  Future<void> signOut() async {
    state = AsyncValue.loading();
    final useCase = ref.read(signOutUseCase);

    state = await AsyncValue.guard(() async {
      await useCase.signOut();

      return AuthState(message: 'Sign out', failed: false);
    });
  }
}

class AuthState {
  final String message;
  final bool failed;
  final AppUser? user;

  AuthState({required this.message, required this.failed, this.user});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
