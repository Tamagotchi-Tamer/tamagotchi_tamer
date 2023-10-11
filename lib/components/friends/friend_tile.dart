import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

class buildFriendListTile extends StatefulWidget {

  const buildFriendListTile(this.userID);

  final String userID;

  /*
  @override
  State<buildFriendListTile> createState() => _buildFriendListTileState();
   */

  @override
  State<StatefulWidget> createState() {
    return _buildFriendListTileState();
  }

}

class _buildFriendListTileState extends State<buildFriendListTile> {


  Widget plusTile() {
    UserData data = userDB.getUser(widget.userID);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Text(data.initials),
      ),
      title: Text(data.name),
      subtitle: Text(data.username),
      trailing: ElevatedButton(
        onPressed: () {
          setState(() {
            buildTile = pendingTile();
          });
        },
        child: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.redAccent,
        ),

      ),
    );
  }

  Widget pendingTile() {
    UserData data = userDB.getUser(widget.userID);
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

  late Widget buildTile;

  void initState() {
    buildTile = plusTile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return buildTile;
  }
}

