import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/app.dart';
import 'package:tamagotchi_tamer/pages/settings/settings_controller.dart';
import 'package:tamagotchi_tamer/pages/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}

