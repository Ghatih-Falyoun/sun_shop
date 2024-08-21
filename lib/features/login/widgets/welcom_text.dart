import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class WelcomText extends StatelessWidget {
  const WelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          'Welcome Back',
          style: textStyles.medium32Black,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Enter your details below',
          style: textStyles.reqular20Gray,
        )
      ],
    );
  }
}
