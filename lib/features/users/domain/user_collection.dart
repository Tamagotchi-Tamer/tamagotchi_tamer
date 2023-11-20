import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection {
  UserCollection(users) : _users = users;

  final List<User> _users;

  int length() {
    return _users.length;
  }

  User getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  bool areUserNames(List<String> userNames) {
    List<String> allUserNames =
    _users.map((userData) => userData.username).toList();
    return userNames.every((userName) => allUserNames.contains(userName));
  }

  String getUserID(String emailOrUsername) {
    return (emailOrUsername.startsWith('@'))
        ? _users.firstWhere((user) => user.username == emailOrUsername).id
        : _users.firstWhere((user) => user.id == emailOrUsername).id;
  }

  bool isUserEmail(String email) {
    List<String> emails = _users.map((user) => user.id).toList();
    return emails.contains(email);
  }

  List<User> getUsers(List<String> userIDs) {
    return _users.where((user) => userIDs.contains(user.id)).toList();
  }

  List<String> getAllEmails() {
    return _users.map((user) => user.id).toList();
  }

  List<User> otherUsers(String currentUserId) {
    List<User> allData = _users.where((userData) => userData.id != currentUserId).toList();
    return allData;
  }

  List<String> getEmails() {
    return _users.map((data) => data.email).toList();
  }

  User? getUserByEmail(String email) {
    if(getEmails().contains(email)) {
      return _users.firstWhere((data) => data.email == email);
    }
    else {
      return null;
    }
  }


}
