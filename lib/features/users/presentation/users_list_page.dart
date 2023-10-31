import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/user_providers.dart';
import 'user_tile.dart';
import '../domain/user_db.dart';

class UsersList extends ConsumerWidget {

  late final String userID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    UserDB userDB = ref.read(userDBProvider);
    String currentUserRef = ref.watch(currentUserIDProvider);
    UserData currentUser = userDB.getUser(currentUserRef);

    ref.watch(userDBProvider);

    Widget userList;
    userList = ListView.builder(
      itemBuilder: (context, i) {
        List<UserData> addUsers = userDB.otherUsers(currentUser.id);
        String thisUser = addUsers[i].id;
        return buildFriendListTile(ref, thisUser);
        //Pulls directly from user_db for the friends list
      },
      itemCount: userDB.length() - 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Users List")
      ),
      body: userList,
    );


  }

}