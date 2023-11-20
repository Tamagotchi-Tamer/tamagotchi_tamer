import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tamagotchi_tamer/features/users/data/user_providers.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';

import 'friends/data/friend_providers.dart';
import 'friends/domain/friend.dart';

part 'all_data_provider.g.dart';

class AllData {
  AllData({required this.users, required this.currentUserID, required this.friends});

  final List<User> users;
  final List<Friend> friends;
  final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  final friends = ref.watch(friendsProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
    users: await users,
    friends: await friends,
    currentUserID: currentUserID,
  );

}