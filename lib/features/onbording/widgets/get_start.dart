import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(32))),
      height: 690.h,
      child: Column(
    
        children: [
          Image.asset(
            'assets/images/sun_shopping.png',
            height: 330,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.h, vertical: 30.w),
            child: Text(
              'Get Start With Summer Collection',
              style: textStyles.medium32Black,
              textAlign: TextAlign.center,
            ),
          ),
          GradientButton(
              textStyle: textStyles.reqular24Black,
              height: 62,
              width: 382,
              text: 'Get Start',
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              })
        ],
      ),
    );
  }
}
