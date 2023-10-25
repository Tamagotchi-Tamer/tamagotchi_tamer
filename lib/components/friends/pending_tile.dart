import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data_model/user_db.dart';

class pendingTile extends ConsumerWidget {

  pendingTile(this.currentUser, {super.key});

  late final String currentUser;

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
      trailing: Text("Pending"),
    );
  }
}