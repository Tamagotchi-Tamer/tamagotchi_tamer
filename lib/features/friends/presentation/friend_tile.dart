import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../users/data/user_providers.dart';
import '../../users/domain/user_db.dart';

class FriendTile extends ConsumerWidget {

  FriendTile(this.currentUser);


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
      trailing: Text("Other Feature"),

     /*
      ElevatedButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.redAccent,
        ),
      ),

      */
    );
  }

}