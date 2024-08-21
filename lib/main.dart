import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/constants.dart';
import 'package:sun_shop/core/helpers/shared_prefrences.dart';
import 'package:sun_shop/core/routes/app_route.dart';
import 'package:sun_shop/sun_shop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isItLoginOrNot();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  AppRoute appRoute = AppRoute();
  runApp(SunShopApp(appRoute));
}

isItLoginOrNot() async {
  String? user = await SharedPrefHelper.getString(Constants.UserId);
  if (user == null || user.isEmpty) {
    Constants.IsLogin = false;
    print('hello world');
  }else{
    Constants.IsLogin = true;
    print('hello world2');
  }
}
