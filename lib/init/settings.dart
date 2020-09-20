import 'package:getting_start_enguerrand/models/settings.dart';
import 'package:getting_start_enguerrand/services/preference.dart';

Future<Settings> loadSettings() async {
  PreferenceService service = PreferenceService();
  return Settings(
    brightness: await service.getThemeMode(),
    locale: await service.getLocale(),
  );
}
