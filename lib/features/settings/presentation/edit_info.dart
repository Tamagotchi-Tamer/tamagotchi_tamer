
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_db.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/settings_page.dart';

import '../../all_data_provider.dart';
import '../../home/presentation/Home.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../../users/data/user_providers.dart';
import '../../users/domain/user.dart';
import '../../users/presentation/edit_user_controller.dart';


class EditUserInfo extends ConsumerWidget {

  static const routeName = '/editUserInfo';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _initialsFieldKey = GlobalKey<FormBuilderFieldState>();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

      final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
      return asyncAllData.when(
          data: (allData) => _build(
              context: context,
              currentUserID: allData.currentUserID,
              users: allData.users,
              ref: ref),
          loading: () => const TTLoading(),
          error: (e, st) => TTError(e.toString(), st.toString()));
    }


    Widget _build({
      required BuildContext context,
      required String currentUserID, required WidgetRef ref, required List<User> users,
    }) {
      void onSubmit() {
        bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
        if (!isValid) return;

        String actualEmail = currentUserID;

        String newID = actualEmail;
        String newName = _nameFieldKey.currentState?.value;
        String newUsername = _usernameFieldKey.currentState?.value;
        String newEmail = _emailFieldKey.currentState?.value;
        String newInitials = _initialsFieldKey.currentState?.value;


        User newUser = User(
          id: newID,
          name: newName,
          username: newUsername,
          email: newEmail,
          initials: newInitials,

        );

        ref.read(editUserControllerProvider.notifier).updateUser(
            user: newUser,
            onSuccess: () {
              Navigator.pop(context);
            }
        );
      }

      UserCollection userCollection = UserCollection(users);

      final String currName = userCollection.getUser(currentUserID)?.name ?? "";
      final String currUsername = userCollection.getUser(currentUserID)?.username ?? "";
      final String currEmail = userCollection.getUser(currentUserID)?.email ?? "";
      final String currInitials = userCollection.getUser(currentUserID)?.initials ?? "";


      return Scaffold(
        appBar: AppBar(
          title: Text("Change User Info"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Column(
              children: [
                FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: "Your Name",
                          key: _nameFieldKey,
                          initialValue: currName,
                          decoration: InputDecoration(
                              labelText: "Your Name",
                              hintText: "Example: John Doe"
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        FormBuilderTextField(
                          name: "Username",
                          key: _usernameFieldKey,
                          initialValue: currUsername,
                          decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Example: johnDoe",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        FormBuilderTextField(
                          name: "Email",
                          key: _emailFieldKey,
                          initialValue: currEmail,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Example: johnDoe@hawaii.edu",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        FormBuilderTextField(
                          name: "Initials",
                          key: _initialsFieldKey,
                          initialValue: currInitials,
                          decoration: InputDecoration(
                            labelText: "Initials",
                            hintText: "Example: JD",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),

                      ],
                    )
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          onSubmit();
                        },
                        child: Text(
                            "Submit"
                        )
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                )
              ],

            ),

          ],

        ),

      );
    }

}