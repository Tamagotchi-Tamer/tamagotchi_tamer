

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/repositories/firestore/firestore_path.dart';

import '../../../repositories/firestore/firestore_service.dart';
import '../domain/friend.dart';

class FriendsDatabase {
  FriendsDatabase(this.ref);

  final ProviderRef<FriendsDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Friend>> watchFriends() => _service.watchCollection(
      path: FirestorePath.friends(),
      builder: (data, documentID) => Friend.fromJson(data!));

  Stream<Friend> watchFriend(String friendID) => _service.watchDocument(
      path: FirestorePath.friend(friendID),
      builder: (data, documentID) => Friend.fromJson(data!));

  Future<List<Friend>> fetchFriends() => _service.fetchCollection(
      path: FirestorePath.friends(),
      builder: (data, documentID) => Friend.fromJson(data!));

  Future<Friend> fetchFriend(String friendID) => _service.fetchDocument(
      path: FirestorePath.friend(friendID),
      builder: (data, documentID) => Friend.fromJson(data!));

  Future<void> setFriend(Friend friend) => _service.setData(
      path: FirestorePath.friend(friend.id), data: friend.toJson());

}