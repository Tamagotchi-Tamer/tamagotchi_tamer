

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

class FriendDB {

  FriendDB(this.ref);
  final ProviderRef<FriendDB>ref;

  final Map<String, List<UserData>> _friends = {
    'user-001': [
      UserData(
        id: 'user-002',
        name: 'Cody Tanaka',
        username: 'SwagSauce',
        email: 'codyt@gmail.com',
        initials: 'CT',
      ),
      UserData(
        id: 'user-003',
        name: 'Jason Shimoko',
        username: 'shmoo',
        email: 'jshimoko@gmail.com',
        initials: 'JS',
      ),
    ],
    'user-002': [
      UserData(
        id: 'user-001',
        name: 'Derek Nishimura',
        username: 'dereknis',
        email: 'nishimuradj@gmail.com',
        imagePath: 'assets/images/user-001.jpg',
        initials: 'DN',
      ),
      UserData(
        id: 'user-003',
        name: 'Jason Shimoko',
        username: 'shmoo',
        email: 'jshimoko@gmail.com',
        initials: 'JS',
      ),
    ],
  };

  List<UserData> getFriends(String userID) {
    return _friends[userID] ?? [];
  }

  int getNumberOfFriends(String userID) {
    final friendsList = getFriends(userID);
    return friendsList.length;
  }

  bool isFriend(String currentUserID, String userIDToCheck) {
    final friendsList = getFriends(currentUserID);
    return friendsList.any((friend) => friend.id == userIDToCheck);
  }

  void addFriend(String userID, UserData friend) {
    if (_friends.containsKey(userID)) {
      // Check if the user is already friends with the given friend.
      if (!_friends[userID]!.any((user) => user.id == friend.id)) {
        _friends[userID]!.add(friend);
      }
    } else {
      // If the user is not in the friends database, create a new entry.
      _friends[userID] = [friend];
    }
  }
}



final friendDBProvider = Provider<FriendDB>((ref) {
  return FriendDB(ref);
});