import 'package:flutter/material.dart';
import 'package:valbury_coding_test/utils/routes/routes_name.dart';
import 'package:valbury_coding_test/views/login_register/login_activity.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginActivity()
        );
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginActivity()
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}