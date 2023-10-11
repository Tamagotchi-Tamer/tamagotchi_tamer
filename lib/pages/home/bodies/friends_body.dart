import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/components/friends/friend_tile.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

class FriendsBody extends StatefulWidget {
  final String userID;
  //const FriendsBody({super.key});

  const FriendsBody({Key? key, required this.userID}) : super(key: key);

  @override
  _FriendsBodyState createState() => _FriendsBodyState();
}

class _FriendsBodyState extends State<FriendsBody>{


  @override
  Widget build(BuildContext context) {


    Widget friendList;
    friendList = ListView.builder(
        itemBuilder: (context, i) {
          List<UserData> addUsers = userDB.allUsers();
          String thisUser = addUsers[i].id;
          return buildFriendListTile(thisUser);
          //Pulls directly from user_db for the friends list
        },
      itemCount: userDB.length(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Friends"
        ),
      ),
      body: friendList,
    );
  }

}