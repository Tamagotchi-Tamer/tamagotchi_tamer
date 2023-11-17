import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';

import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../data/user_providers.dart';
import '../domain/user_db.dart';

class UserFriendTile extends ConsumerWidget {

  UserFriendTile(this.currentUser);


  final String currentUser;

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

  Widget _build({required BuildContext context, required String currentUserID, required List<User> users}) {

    UserCollection userCollection = UserCollection(users);

    var data = userCollection.getUser(currentUserID);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Text(data.initials),
      ),
      title: Text(data.name),
      subtitle: Text(data.username),
      /*
      trailing: ElevatedButton(
        onPressed: () {
        },
        child: Icon(Icons.check),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.redAccent,
        ),


      ),
       */
      trailing: Container(
          width: 60,
          child: Icon(Icons.check)

      ),
    );
  }




}