import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/bloc.dart';
import 'package:getting_start_enguerrand/blocs/app_settings/events.dart';
import 'package:getting_start_enguerrand/constants.dart';
import 'package:getting_start_enguerrand/models/settings.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  final Settings settings;
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  App({@required this.settings});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// List of global bloc
      providers: [
        BlocProvider(create: (context) => AppSettingsBloc(settings)),

        /// ...
      ],

      /// When app settings changed, rebuild
      child: Provider<FirebaseAnalytics>.value(
        value: analytics,
        child: BlocBuilder<AppSettingsBloc, AppSettingsEvent>(
          builder: (BuildContext context, AppSettingsEvent event) {
            Settings settings = BlocProvider.of<AppSettingsBloc>(context).settings;
            return MaterialApp(
              title: APP_NAME,
              // Assign '/' to home: Root()
              initialRoute: "/",
              home: Home(),
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
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
      ),
    );
  }
}
