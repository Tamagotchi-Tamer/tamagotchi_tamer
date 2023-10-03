
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
         theme: ThemeData(
           colorScheme: const ColorScheme(
             brightness: Brightness.light,
             primary: Color.fromRGBO(240, 0, 0, 20),
             onPrimary: Colors.black,
             secondary: Colors.grey,
             onSecondary: Colors.grey,
             background: Colors.grey,
             onBackground: Colors.grey,
             surface: Colors.grey,
             onSurface: Colors.grey,
             error: Colors.grey,
             onError: Colors.grey,
           ),
         ),
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