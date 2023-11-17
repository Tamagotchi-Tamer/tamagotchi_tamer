import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/Login.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';

import '../../all_data_provider.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import 'edit_info.dart';

class SettingsPage extends ConsumerWidget {

  static const routeName = "/settings";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
                context: context,
                currentUserID: allData.currentUserID,
                users: allData.users,
                ref: ref),
        loading: () => const TTLoading(),
        error: (e, st) => TTError(e.toString(), st.toString()));
  }

  Widget _build({required BuildContext context, required String currentUserID, required List<User> users, required WidgetRef ref}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
            children:[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUserInfo())
                  );
                },
                child: Text(
                  "Edit User Info",
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(240, 80),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Text(
                    "Tamagotchi Info",
                  );
                },
                child: Text(
                  "Tamagotchi Info",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(240, 80),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseUIAuth.signOut(context: context);
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  Text(
                    "Sign out",
                  );
                },
                child: Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(240, 80),
                ),
              ),
            ]

        ),
      ),
    );
  }

}