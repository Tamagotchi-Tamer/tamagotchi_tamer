import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  //Go to form page

                },
                child: Text(
                  "User Info",
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