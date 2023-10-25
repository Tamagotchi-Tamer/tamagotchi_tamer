
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';
import 'package:tamagotchi_tamer/pages/settings/settings_page.dart';


class EditUserInfo extends ConsumerWidget {

  static const routeName = '/editUserInfo';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _initialsFieldKey = GlobalKey<FormBuilderFieldState>();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final UserDB userDB = ref.watch(userDBProvider);
    final String currentID = ref.read(currentUserIDProvider);

    final String currentName = userDB.getUser(currentID).name;
    final String currentUsername = userDB.getUser(currentID).username;
    final String currentEmail = userDB.getUser(currentID).email;
    final String currentInitials = userDB.getUser(currentID).initials;

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;

      String newName = _nameFieldKey.currentState?.value;
      String newUsername = _usernameFieldKey.currentState?.value;
      String newEmail = _emailFieldKey.currentState?.value;
      String newInitials = _initialsFieldKey.currentState?.value;


      userDB.updateUser(
          id: currentID,
          name: newName,
          username: newUsername,
          email: newEmail,
          initials: newInitials,
      );

      Navigator.pop(context);

    }

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
                        initialValue: currentName,
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
                        initialValue: currentUsername,
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
                        initialValue: currentEmail,
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
                        initialValue: currentInitials,
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