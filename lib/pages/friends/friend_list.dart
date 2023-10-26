import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/components/friends/friend_tile.dart';
import 'package:tamagotchi_tamer/data_model/friend_db.dart';

import '../../data_model/user_db.dart';

class FriendList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    UserDB userDB = ref.read(userDBProvider);
    FriendDB friendDB = ref.read(friendDBProvider);
    String currentUserRef = ref.watch(currentUserIDProvider);
    UserData currentUser = userDB.getUser(currentUserRef);


    ref.watch(userDBProvider);

    Widget friendList;
    friendList = ListView.builder(
      itemBuilder: (context, i) {
        List<UserData> addUsers = friendDB.getFriends(currentUser.id);
        String thisUser = addUsers[i].id;
        return FriendTile(thisUser);
        //Pulls directly from user_db for the friends list
      },
      itemCount: friendDB.getNumberOfFriends(currentUser.id),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Friends List"),
      ),
      body: friendList,

    );
  }


}