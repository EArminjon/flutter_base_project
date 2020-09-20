import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getting_start_enguerrand/app.dart';
import 'package:getting_start_enguerrand/init/flutter.dart';
import 'package:getting_start_enguerrand/init/settings.dart';
import 'package:getting_start_enguerrand/models/settings.dart';

/// Init app
Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initRotation();
}

void main() async {
  await init();
  Settings settings = await loadSettings();
  runApp(App(settings));
}
