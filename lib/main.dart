import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'features/settings/presentation/settings_controller.dart';
import 'features/settings/presentation/settings_service.dart';

/// Set up settings and wrap app in ProviderScope
void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  // Run the app and pass in the SettingsController.
  runApp(ProviderScope(child: MyApp(settingsController: settingsController)));
}
