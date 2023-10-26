import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/components/friends/pending_tile.dart';
import 'package:tamagotchi_tamer/components/friends/plus_tile.dart';
import 'package:tamagotchi_tamer/components/friends/user_friend_tile.dart';
import 'package:tamagotchi_tamer/data_model/friend_db.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

class buildFriendListTile extends ConsumerStatefulWidget {

  buildFriendListTile(ref, this.currentUser, {super.key});

  final String currentUser;
  /*
  @override
  State<buildFriendListTile> createState() => _buildFriendListTileState();
   */
  /*
  @override
  State<StatefulWidget> createState() {
    return _buildFriendListTileState();
  }
   */

  @override
  ConsumerState<buildFriendListTile> createState() => _buildFriendListTileState();


}

class _buildFriendListTileState extends ConsumerState<buildFriendListTile> {
  late Widget buildTile;
  bool _isPending = false;

  void isPendingWidget(bool isPendingCheck) {
    setState(() {
      _isPending = isPendingCheck;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final FriendDB friendDB = ref.read(friendDBProvider);
        final UserDB userDB = ref.read(userDBProvider);
        final String currentUserID = ref.read(currentUserIDProvider);

        if(friendDB.isFriend(currentUserID, widget.currentUser)){
          buildTile = UserFriendTile(widget.currentUser);

        } else {
          buildTile = plusTile(isPendingWidget, widget.currentUser);

          if(_isPending == true) {
            //buildTile = pendingTile(widget.currentUser);
            ///Ideally in a two way friend system we would have a pending notice
            ///For the sake of simplicity in this project we will stick with a one way system

            final friendToAdd = userDB.getUser(widget.currentUser);

            friendDB.addFriend(currentUserID, friendToAdd);


            buildTile = UserFriendTile(widget.currentUser);
          }
        }
        return buildTile;
      },

    );


  }
}

