import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/bloc.dart';
import 'package:getting_start_enguerrand/extension/translation.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RaisedButton(
                onPressed: () async {
                  await FirebaseCrashlytics.instance.log("I'm a log message");
                  FirebaseCrashlytics.instance.crash();
                },
                child: Text("CRASH"),
              ),
              RaisedButton(
                onPressed: () async {
                  final settings = BlocProvider.of<AppSettingsBloc>(context).settings;
                  final bloc = BlocProvider.of<AppSettingsBloc>(context);

                  String lang = settings.locale == "en" ? "fr" : "en";
                  Provider.of<FirebaseAnalytics>(context, listen: false).logEvent(name: "Change_language", parameters: {"lang": lang});
                  bloc.doChangeLocale(lang);
                },
                child: Text("language".i18n),
              ),
              RaisedButton(
                onPressed: () async {
                  final settings = BlocProvider.of<AppSettingsBloc>(context).settings;
                  final bloc = BlocProvider.of<AppSettingsBloc>(context);

                  Brightness brightness = settings.brightness == Brightness.dark ? Brightness.light : Brightness.dark;
                  Provider.of<FirebaseAnalytics>(context, listen: false).logEvent(name: "Change_theme", parameters: {"brightness": brightness.index});
                  await bloc.doChangeTheme(brightness);
                },
                child: Text("theme".i18n),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
