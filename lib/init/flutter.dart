import 'package:flutter/services.dart';

/// Avoid bug when app didn't handle all rotations
Future initRotation() async {
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
}
