import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend_collection.dart';
import 'package:tamagotchi_tamer/features/friends/presentation/pending_tile.dart';
import 'package:tamagotchi_tamer/features/friends/presentation/plus_tile.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';
import 'package:tamagotchi_tamer/features/users/presentation/user_friend_tile.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend_db.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_db.dart';

import '../../all_data_provider.dart';
import '../../friends/data/friend_providers.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../data/user_providers.dart';

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
        final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
        return asyncAllData.when(
            data: (allData) =>
                _build(
                    context: context,
                    currentUserID: allData.currentUserID,
                    friends: allData.friends,
                    users: allData.users),
            loading: () => const TTLoading(),
            error: (error, st) => TTError(error.toString(), st.toString()));
      },

    );
  }
    Widget _build({required BuildContext context, required String currentUserID, required List<User> users, required List<Friend> friends}) {

    UserCollection userCollection = UserCollection(users);
    FriendCollection friendCollection = FriendCollection(friends);

      if(friendCollection.isFriend(currentUserID, widget.currentUser)){
        buildTile = UserFriendTile(widget.currentUser);

      } else {
        buildTile = plusTile(isPendingWidget, widget.currentUser);

        if(_isPending == true) {
          //buildTile = pendingTile(widget.currentUser);
          ///Ideally in a two way friend system we would have a pending notice
          ///For the sake of simplicity in this project we will stick with a one way system

          final friendToAdd = userCollection.getUser(widget.currentUser);

          Friend newFriend = Friend(id: friendToAdd.id, name: friendToAdd.name);

          friendCollection.addFriend(currentUserID, newFriend);


          buildTile = UserFriendTile(widget.currentUser);
        }
      }
      return buildTile;
    }

}

