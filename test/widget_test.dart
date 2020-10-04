import 'package:flutter_test/flutter_test.dart';
import 'package:getting_start_enguerrand/app.dart';
import 'package:getting_start_enguerrand/init/settings.dart';
import 'package:getting_start_enguerrand/models/settings.dart';

void main() {
  testWidgets('Build app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Settings settings = await loadSettings();
    await tester.pumpWidget(App(settings: settings));
  });
}
