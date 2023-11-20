import 'friend.dart';

class FriendCollection {

  FriendCollection(friends) : _friends = friends;

  //final Map<String, List<Friend>> _friends;

  final List<Friend> _friends;

  List<Friend> getFriends(String userID) {
    //return _friends[userID] ?? [];
    return _friends;
  }

  int getNumberOfFriends(String userID) {
    final friendsList = getFriends(userID);
    return friendsList.length;
  }

  bool isFriend(String currentUserID, String userIDToCheck) {
    final friendsList = getFriends(currentUserID);
    return friendsList.any((friend) => friend.id == userIDToCheck);
  }

  /*
  void addFriend(String userID, Friend friend) {
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

   */

}