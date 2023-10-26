import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_model/user_db.dart';

class UserFriendTile extends ConsumerWidget {

  UserFriendTile(this.currentUser);


  final String currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserDB userDB = ref.read(userDBProvider);
    UserData data = userDB.getUser(currentUser);

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