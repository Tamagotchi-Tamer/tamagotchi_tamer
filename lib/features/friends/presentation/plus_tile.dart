import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/friends/presentation/pending_tile.dart';

import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../../users/data/user_providers.dart';
import '../../users/domain/user.dart';
import '../../users/domain/user_collection.dart';
import '../../users/domain/user_db.dart';

class plusTile extends ConsumerWidget {


  plusTile(this.isPendingWidget, this.currentUser, {super.key});


  final String currentUser;
  final Function(bool) isPendingWidget;

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

    var data = userCollection.getUser(currentUser);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Text(data.initials),
      ),
      title: Text(data.name),
      subtitle: Text(data.username),
      trailing: ElevatedButton(
        onPressed: () {
          isPendingWidget(true);
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
}