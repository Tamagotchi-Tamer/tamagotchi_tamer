import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend_collection.dart';
import 'package:tamagotchi_tamer/features/friends/presentation/friend_tile.dart';
import 'package:tamagotchi_tamer/features/friends/domain/friend_db.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';

import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../../users/data/user_providers.dart';
import '../../users/domain/user_db.dart';
import '../data/friend_providers.dart';

class FriendList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

  }

  Widget _build({required BuildContext context, required String currentUserID, required List<Friend> friends, required List<User> users}) {

    FriendCollection friendCollection = FriendCollection(friends);

    Widget friendList;
    friendList = ListView.builder(
      itemBuilder: (context, i) {
        List<Friend> addUsers = friendCollection.getFriends(currentUserID);
        String thisUser = addUsers[i].id;
        return FriendTile(thisUser);
        //Pulls directly from user_db for the friends list
      },
      itemCount: friendCollection.getNumberOfFriends(currentUserID),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Friends List"),
      ),
      body: friendList,

    );
  }


}