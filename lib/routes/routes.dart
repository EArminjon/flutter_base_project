import 'package:flutter/material.dart';
import 'package:getting_start_enguerrand/pages/home.dart';

import 'transitions.dart';

class RouteGenerator {
  final String routeName;

  RouteGenerator(this.routeName);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteGenerator route = RouteGenerator(settings.name);
    final dynamic args = settings.arguments ?? {};
    switch (settings.name) {
      default:
        return route.normal(Home());
    }
  }

  cancelBack(Widget widget) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WillPopScope(onWillPop: () async => false, child: widget),
    );
  }

  normal(Widget widget) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  fade(Widget widget) {
    return FadeRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  zoom(Widget widget) {
    return ZoomRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  slide(Widget widget) {
    return SlideRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }
}
