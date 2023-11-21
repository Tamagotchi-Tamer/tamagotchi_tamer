import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide UserAvatar;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/Login.dart';
import 'package:tamagotchi_tamer/features/home/presentation/Home.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/edit_info.dart';
import 'package:tamagotchi_tamer/features/tt_error.dart';
import 'package:tamagotchi_tamer/features/tt_loading.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';

import 'all_data_provider.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';



/// Builds the drop-down Drawer with the menu of top-level pages.
class SettingsDropdown extends ConsumerWidget {
  const SettingsDropdown({Key? key}) : super(key: key);

  @override
  build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            users: allData.users),
        loading: () => const TTLoading(),
        error: (error, st) => TTError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required List<User> users,
        required String currentUserID}) {
    UserCollection userCollection = UserCollection(users);
    User user = userCollection.getUser(currentUserID);
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Edit User'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditUserInfo())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Edit Tamagotchi'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              FirebaseUIAuth.signOut(context: context);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
