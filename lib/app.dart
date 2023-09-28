
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/pages/home/Home.dart';
import 'package:tamagotchi_tamer/pages/page_not_found/page_not_found.dart';
import 'package:tamagotchi_tamer/pages/settings/settings_controller.dart';
import 'package:tamagotchi_tamer/pages/signin/Login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
     animation: settingsController,
     builder: (BuildContext context, Widget? child) {
       return MaterialApp(
         onGenerateRoute: (RouteSettings routeSettings) {
           return MaterialPageRoute<void>(
             settings: routeSettings,
             builder: (BuildContext context) {
               switch (routeSettings.name) {
                 case LoginPage.routeName:
                   return LoginPage();
                 case HomePage.routeName:
                   return const HomePage();
                 default:
                   return const PageNotFound();
               }
             }
           );
         }
       );
     }
    );
  }
}