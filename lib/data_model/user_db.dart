class UserData {

  UserData(
      {required this.id,
        required this.name,
        required this.email,
        required this.username,
        required this.initials,
        this.imagePath,
        });

  String id;
  String name;
  String email;
  String username;
  String initials;
  String? imagePath;
}

/// Provides access to and operations on all defined users.
class UserDB {
  final List<UserData> _users = [
    UserData(
      id: 'user-001',
      name: 'Derek Nishimura',
      username: '@dereknis',
      email: 'nishimuradj@gmail.com',
      imagePath: 'assets/images/user-001.jpg',
      initials: 'DN',
  ),
    UserData(
      id: 'user-002',
      name: 'Cody Tanaka',
      username: '@SwagSauce',
      email: 'codyt@gmail.com',
      initials: 'CT',
    ),
    UserData(
      id: 'user-003',
      name: 'Jason Shimoko',
      username: '@shmoo',
      email: 'jshimoko@gmail.com',
      initials: 'JS',
    ),
    UserData(
      id: 'user-004',
      name: 'Colby Fuke',
      username: '@armaw',
      email: 'armaw@hawaii.edu',
      initials: 'CF',
    ),
    UserData(
      id: 'user-005',
      name: 'Dylan Iwamoto',
      username: '@MaskedSamura1',
      email: 'dylaniwa@gmail.com',
      imagePath: 'assets/images/user-005.jpg',
      initials: 'DI',
    ),
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }
  
  List<UserData> allUsers() {
    List<UserData> allData = [];
    _users.forEach((userData) {allData.add(userData);});
    return allData;
  }

  int length() {
    return _users.length;
  }

  // Return the userIDs of users who are in the same Chapter(s) as [userID].
  // First, get all of the chapterIDs that this [userID] is associated with.
  // Then build the set of all userIDs associated with the chapterIDs.
  /*
  List<String> getAssociatedUserIDs(String userID) {
    List<String> chapterIDs = chapterDB.getAssociatedChapterIDs(userID);
    Set<String> userIDs = {};
    for (var chapterID in chapterIDs) {
      userIDs.addAll(chapterDB.getAssociatedUserIDs(chapterID));
    }
    return userIDs.toList();
  }
   */
}

/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();

/// The currently logged in user.
String currentUserID = 'user-001';
