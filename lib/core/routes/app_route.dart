import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/features/customer_home/home_screen.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/login/logic/cubit/login_cubit.dart';
import 'package:sun_shop/features/login/login_screen.dart';
import 'package:sun_shop/features/onbording/on_bording_screen.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_cubit.dart';
import 'package:sun_shop/features/sinup/singup_screen.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_cubit.dart';
import 'package:sun_shop/features/supplier_home/supplier_home_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings Route) {
    switch (Route.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBordingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.HomeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit()..loadStoreScreen(),
            child: HomeScreen(),
          ),
        );
      case Routes.singUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SingupCubit()..printt(),
            child: SingupScreen(),
          ),
        );
      case Routes.SupplierHomeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SupplierHomeCubit()..loadProductScreen(),
            child: SupplierHomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
