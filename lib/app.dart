
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/features/home/presentation/Home.dart';
import 'package:tamagotchi_tamer/features/page_not_found/presentation/page_not_found.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/settings_controller.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/settings_page.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/Login.dart';
import 'package:tamagotchi_tamer/features/home/presentation/status.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
     animation: settingsController,
     builder: (BuildContext context, Widget? child) {
       return MaterialApp(
         theme:

         ThemeData(
           colorScheme: const ColorScheme(
             brightness: Brightness.light,
             primary: Color.fromRGBO(240, 0, 0, 20),
             onPrimary: Colors.white,
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
                 case Status.routeName:
                   return const Status();
                 case SettingsPage.routeName:
                   return SettingsPage();
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