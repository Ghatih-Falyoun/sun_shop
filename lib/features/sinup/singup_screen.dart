import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/widgets/colorful_background.dart';
import 'package:sun_shop/features/login/widgets/custom_app_row.dart';
import 'package:sun_shop/features/sinup/widgets/singup_card.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColorfulBackground(
              child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppRow(massageText: 'Do you have an account?',buttonText: 'Log in',onPressed: () => context.pushNamed(Routes.loginScreen),),
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
              singupCard(),
          
            ],
          ),
        ),
              ),
            ));
  }
}
