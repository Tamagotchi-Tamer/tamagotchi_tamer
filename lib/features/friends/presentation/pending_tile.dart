import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';
import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../../users/data/user_providers.dart';
import '../../users/domain/user_collection.dart';
import '../../users/domain/user_db.dart';

class pendingTile extends ConsumerWidget {

  pendingTile(this.currentUser, {super.key});

  late final String currentUser;

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
        trailing: Text("Pending"),
      );
    }

}