import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/login/widgets/google_and_facbook.dart';
import 'package:sun_shop/features/sinup/widgets/email_and_password_and_name.dart';
import 'package:sun_shop/features/sinup/widgets/get_started.dart';

class singupCard extends StatelessWidget {
  const singupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(32))),
      width: double.infinity,
      height: 800.h,
      child: Column(
        children: [
          GetStartedText(),
          SizedBox(height: 30.h),
          EmailAndPasswordAndName(),
          SizedBox(
            height: 10.h,
          ),
          orSingWith(),
          SizedBox(
            height: 20.h,
          ),
          GoogleAndFacbook()
        ],
      ),
    );
    ;
  }

  Widget orSingWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
              width: 130.w,
              child: const Divider(
                color: colorManager.gray,
              )),
          const Text(
            'Or Sing With',
            style: textStyles.reqular14lightGray,
          ),
          SizedBox(
              width: 130.w,
              child: const Divider(
                color: colorManager.gray,
              ))
        ],
      ),
    );
  }
}
