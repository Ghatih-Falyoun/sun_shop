import 'package:flutter/material.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/features/login/login_screen.dart';
import 'package:sun_shop/features/onbording/on_bording_screen.dart';
import 'package:sun_shop/features/sinup/singup_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings Route) {
    switch (Route.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBordingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case Routes.singUpScreen:
        return MaterialPageRoute(
          builder: (context) => SingupScreen(),
        );
      default:
        return null;
    }
  }
}
