
class FirestorePath {
  static String user(String userID) => 'users/$userID';
  static String users() => 'users';

  static String friend(String friendID) => 'friends/$friendID';
  static String friends() => 'friends';
}