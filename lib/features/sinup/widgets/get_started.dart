import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class GetStartedText extends StatelessWidget {
  const GetStartedText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          'Get start you sun shop',
          style: textStyles.medium32Black,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Discover our sun shop  ',
          style: textStyles.reqular20Gray,
        )
      ],
    );
  }
}