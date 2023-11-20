import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tamagotchi_tamer/features/users/data/user_providers.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';


part 'user_data_provider.g.dart';

class UserData {
  UserData({required this.users});

  final List<User> users;
}

@riverpod
Future<UserData> userData(UserDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  return UserData(
    users: await users,
  );

}