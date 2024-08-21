import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/features/login/login_screen.dart';
import 'package:sun_shop/features/onbording/on_bording_screen.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_cubit.dart';
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
          builder: (context) => BlocProvider(
            create: (context) => SingupCubit(),
            child: SingupScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
