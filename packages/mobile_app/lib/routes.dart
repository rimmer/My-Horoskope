import 'package:flutter/material.dart';
import 'package:my_prophet/screens/auth/auth_screen.dart';
import 'package:my_prophet/screens/daily/daily_screen.dart';
import 'package:my_prophet/screens/menu/menu_screen.dart';
import 'package:my_prophet/screens/settings/settings_screen.dart';
import 'package:proste_route_animation/proste_route_animation.dart';

class AppPath {
  static const String auth = '/auth';
  static const String daily = '/daily';
  static const String menu = '/menu';
  static const String settings = '/settings';
  //

  const AppPath._();
  //

  static Route<dynamic> generateRoute(RouteSettings conf) {
    Widget path;
    switch (conf.name) {
      case auth:
      case '/':
        path = const AuthScreen();
        break;
      case daily:
        path = DailyScreen();
        break;
      case menu:
        path = const MenuScreen();
        break;
      case settings:
        path = const SettingsScreen();
        break;
      default:
        throw RouteException("Route not found");
        break;
    }

    return ProsteRouteAnimation.fadeRoute(route: path);
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
