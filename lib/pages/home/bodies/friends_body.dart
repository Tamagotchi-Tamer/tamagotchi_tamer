import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/components/friends/user_tile.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

import '../../friends/friend_list.dart';
import '../../friends/users_list.dart';

class FriendsBody extends ConsumerStatefulWidget {
  const FriendsBody({super.key});

  @override
  _FriendsBodyState createState() => _FriendsBodyState();
}

class _FriendsBodyState extends ConsumerState<FriendsBody>{

  late final String userID;

  @override
  Widget build(BuildContext context) {

    UserDB userDB = ref.read(userDBProvider);


    return Padding(
      padding: const EdgeInsets.all(32),
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersList())
              );

            },
            child: Text(
              "Users List",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80)
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendList())
              );
            },
            child: Text(
              "Friend List",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80)
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: Text(
              "Find a Friend",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80)
            ),
          )
        ],
      ),
    );
  }

}