import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/bloc.dart';
import 'package:getting_start_enguerrand/extension/translation.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () async {
                final settings = BlocProvider.of<AppSettingsBloc>(context).settings;
                final bloc = BlocProvider.of<AppSettingsBloc>(context);
                bloc.doChangeLocale(settings.locale == "en" ? "fr" : "en");
              },
              child: Text("language".i18n),
            ),
            RaisedButton(
              onPressed: () async {
                final settings = BlocProvider.of<AppSettingsBloc>(context).settings;
                final bloc = BlocProvider.of<AppSettingsBloc>(context);
                await bloc.doChangeTheme(settings.brightness == Brightness.dark ? Brightness.light : Brightness.dark);
              },
              child: Text("theme".i18n),
            ),
          ],
        ),
      ),
    );
  }
}
