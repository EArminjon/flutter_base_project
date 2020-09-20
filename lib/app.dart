import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/events.dart';
import 'package:getting_start_enguerrand/constants.dart';
import 'package:getting_start_enguerrand/models/settings.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes/routes.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  final Settings settings;

  App(this.settings);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// List of global bloc
      providers: [
        BlocProvider(create: (context) => AppSettingsBloc(settings)),

        /// ...
      ],

      /// When app settings changed, rebuild
      child: BlocBuilder<AppSettingsBloc, AppSettingsEvent>(
        builder: (BuildContext context, AppSettingsEvent event) {
          Settings settings = BlocProvider.of<AppSettingsBloc>(context).settings;
          return MaterialApp(
            title: APP_NAME,
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('fr'),
            ],
            locale: Locale(settings.locale),
            theme: AppTheme().light(context),
            darkTheme: AppTheme().dark(context),
            themeMode: settings.brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
            builder: (BuildContext context, Widget child) => I18n(child: child),
          );
        },
      ),
    );
  }
}
