import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/events.dart';
import 'package:getting_start_enguerrand/models/settings.dart';
import 'package:getting_start_enguerrand/services/preference.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsEvent> {
  final Settings settings;

  AppSettingsBloc(this.settings) : super(Initial());

  Future doChangeTheme(Brightness brightness) async {
    await PreferenceService().setThemeMode(brightness);
    settings.brightness = brightness;
    add(ChangeTheme());
  }

  Future doChangeLocale(String locale) async {
    await PreferenceService().setLocale(locale);
    settings.locale = locale;
    add(ChangeLocale());
  }

  @override
  Stream<AppSettingsEvent> mapEventToState(AppSettingsEvent event) async* {
    yield (event);
  }
}
