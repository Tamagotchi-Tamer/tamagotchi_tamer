import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';

import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../data/user_providers.dart';
import '../domain/user.dart';
import 'user_tile.dart';
import '../domain/user_db.dart';

class UsersList extends ConsumerWidget {

  late final String userID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
                context: context,
                currentUserID: allData.currentUserID,
                users: allData.users),
        loading: () => const TTLoading(),
        error: (error, st) => TTError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserID,
    required List<User> users,
}) {

    UserCollection userCollection = UserCollection(users);

    Widget userList;
    userList = ListView.builder(
      itemBuilder: (context, i) {
        List<User> addUsers = userCollection.otherUsers(currentUserID);
        String thisUser = addUsers[i].id;
        return buildFriendListTile(key, thisUser);
        //Pulls directly from user_db for the friends list
      },
      itemCount: userCollection.length() - 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Users List")
      ),
      body: userList,
    );


  }

}