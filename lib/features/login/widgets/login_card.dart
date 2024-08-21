import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/login/widgets/email_and_password.dart';
import 'package:sun_shop/features/login/widgets/forgot_password_and_or_sing_with.dart';
import 'package:sun_shop/features/login/widgets/google_and_facbook.dart';
import 'package:sun_shop/features/login/widgets/welcom_text.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(32))),
      //width: double.infinity,
      height: 750.h,
      child: Column(
        children: [
          WelcomText(),
          SizedBox(height: 50.h),
          EmailAndPassword(),
          SizedBox(
            height: 33.h,
          ),
          ForgotPasswordAndOrSingWith(),
          SizedBox(height: 20.h,),
          GoogleAndFacbook()
        ],
      ),
    );
  }
}
