import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class ForgotPasswordAndOrSingWith extends StatelessWidget {
  const ForgotPasswordAndOrSingWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Forgot password ?',
          style: textStyles.reqular16Black,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
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
        )
      ],
    );
  }
}
