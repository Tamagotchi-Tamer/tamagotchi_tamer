import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/app.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/settings_controller.dart';
import 'package:tamagotchi_tamer/features/settings/presentation/settings_service.dart';

import 'firebase_options.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  //await verifyInitialData();
  runApp(ProviderScope(child: MyApp(settingsController: settingsController)));
}

