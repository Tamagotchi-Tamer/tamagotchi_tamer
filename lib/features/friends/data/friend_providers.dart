import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/friend.dart';
import '../domain/friend_db.dart';
import 'friends_database.dart';

part 'friend_providers.g.dart';

@riverpod
FriendsDatabase friendDatabase(FriendDatabaseRef ref) {
  return FriendsDatabase(ref);
}

@riverpod
Stream<List<Friend>> friends(FriendsRef ref) {
  final database = ref.watch(friendDatabaseProvider);
  return database.watchFriends();
}

/*
final friendDBProvider = Provider<FriendDB>((ref) {
  return FriendDB(ref);
});


 */