import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/components/friends/pending_tile.dart';
import 'package:tamagotchi_tamer/components/friends/plus_tile.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

class buildFriendListTile extends StatefulWidget {

  buildFriendListTile(this.currentUser);

  final String currentUser;
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
  late Widget buildTile;
  bool _isPending = false;

  void isPendingWidget(bool isPendingCheck) {
    setState(() {
      _isPending = isPendingCheck;
    });
  }

  @override
  Widget build(BuildContext context) {

    buildTile = plusTile(isPendingWidget, widget.currentUser);

    if(_isPending == true) {
      buildTile = pendingTile(widget.currentUser);
    }

    return buildTile;
  }
}

