import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tamagotchi_tamer/features/users/data/user_providers.dart';

import '../data/user_database.dart';
import '../domain/user.dart';


part 'edit_user_controller.g.dart';

@riverpod
class EditUserController extends _$EditUserController {
  bool mounted = true;

  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new garden or edit an existing one.
  Future<void> updateUser({
    required User user,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    UserDatabase userDatabase = ref.watch(userDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => userDatabase.setUser(user));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }
}