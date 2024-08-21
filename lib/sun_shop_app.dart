import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/constants.dart';
import 'package:sun_shop/core/helpers/shared_prefrences.dart';
import 'package:sun_shop/core/routes/app_route.dart';
import 'package:sun_shop/core/routes/routes.dart';

class SunShopApp extends StatelessWidget {
  final AppRoute _appRoute;
  const SunShopApp(this._appRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Constants.IsLogin ? Routes.HomeScreen : Routes.onBoardingScreen,
        onGenerateRoute: _appRoute.generateRoute,
      ),
    );
  }
}
