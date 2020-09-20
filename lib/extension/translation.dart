import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("id") +
      {
        "id": "language",
        "en": "Language",
        "fr": "Langue",
      } +
      {
        "id": "theme",
        "en": "Theme",
        "fr": "Thème",
      };

  String get i18n => localize(this, _t);
}
