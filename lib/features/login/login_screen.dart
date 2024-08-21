import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/widgets/colorful_background.dart';
import 'package:sun_shop/features/login/widgets/login_card.dart';
import 'package:sun_shop/features/login/widgets/custom_app_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColorfulBackground(
              child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppRow(massageText: 'Don\'t have an account?',buttonText: 'Get Started',onPressed: () => context.pushNamed(Routes.singUpScreen),),
              SizedBox(
                height: 25.h,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 83,
              ),
              SizedBox(
                height: 30.h,
              ),
              LoginCard(),
          
            ],
          ),
        ),
              ),
            ));
  }
}
