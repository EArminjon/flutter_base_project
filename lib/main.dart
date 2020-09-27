import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:getting_start_enguerrand/app.dart';
import 'package:getting_start_enguerrand/init/firebase.dart';
import 'package:getting_start_enguerrand/init/flutter.dart';
import 'package:getting_start_enguerrand/init/settings.dart';


/// Init app
Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initRotation();
  await initFirebase();
}

void main() async {
  runZonedGuarded(() async {
    await init();
    runApp(App(settings: await loadSettings()));
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
