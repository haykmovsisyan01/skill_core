import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/data/models/user_model.dart';
import 'package:skill_core/domain/entities/user/user.dart';
import 'package:skill_core/presentation/providers/dependencies.dart';

final userNotifierProvider = AsyncNotifierProvider<UserNotifier, UserState>(
  () => UserNotifier(),
);

final appUserState = StateProvider<AppUser?>((ref) => null);

class UserNotifier extends AsyncNotifier<UserState> {
  @override
  FutureOr<UserState> build() async {
    final sharedPrUseCase = ref.read(sharedPreferencesUseCase);

    final userUid = sharedPrUseCase.get('token') as String?;

    if (userUid == null || userUid == '') {
      return UserState(message: 'No authorized user');
    }

    final userUseCase = ref.read(userFireStoreUseCase);

    final result = await userUseCase.fetchUser(userUid);

    if (result.failed) {
      return UserState(message: result.message);
    }

    ref.read(appUserState.notifier).state = result.data;

    return UserState(message: result.message, user: result.data);
  }

  Future<void> changeUserOptions(String? name, String? surname) async {
    state = AsyncValue.loading();
    if (name == null && surname == null) {
      state = AsyncValue.error('Undefined fields', StackTrace.current);
      return;
    }

    final userUseCase = ref.read(userFireStoreUseCase);
    final sharedPrefUseCase = ref.read(sharedPreferencesUseCase);

    final uid = sharedPrefUseCase.get('token') as String?;
    if (uid == null) {
      state = AsyncValue.error(
        'No user found. Please try again',
        StackTrace.current,
      );
      return;
    }

    final result = await userUseCase.changeUserOptions(
      uid,
      UserEntity(name: name, surname: surname),
    );

    if (result.failed) {
      state = AsyncValue.error(result.message!, StackTrace.current);
    } else {
      final user = await userUseCase.fetchUser(uid).then((val) => val.data);

      ref.read(appUserState.notifier).state = user;
      state = AsyncValue.data(UserState(message: result.message));
    }
  }

  Future<void> updateCurrentUser() async {
    state = AsyncValue.loading();

    final userUseCase = ref.read(userFireStoreUseCase);
    final sharedPrefUseCase = ref.read(sharedPreferencesUseCase);

    final uid = sharedPrefUseCase.get('token') as String?;
    if (uid == null) {
      ref.read(appUserState.notifier).state = null;
    } else {
      final result = await userUseCase.fetchUser(uid);

      if (result.failed) {
        ref.read(appUserState.notifier).state = null;
      } else {
        ref.read(appUserState.notifier).state = result.data!;
      }
    }
  }

  Future<void> fetchUser(String uid) async {
    state = AsyncValue.loading();
    final useCase = ref.read(userFireStoreUseCase);

    final result = await useCase.fetchUser(uid);

    if (result.data == null) {
      state = AsyncValue.error(
        UserState(message: result.message!, code: result.code!),
        StackTrace.current,
      );
    } else {
      state = AsyncValue.data(
        UserState(
          message: result.message,
          code: result.code,
          user: result.data,
        ),
      );
    }
  }
}

class UserState {
  final String? message;
  final String? code;
  final AppUser? user;

  UserState({this.message, this.code, this.user});
}
