import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                height: 60,
                color: colorManager.grayWith,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0.h),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined,size: 40,color: Color(0xff2D4A98,),),
                      Text(
                        'Order summary',
                        style: textStyles.reqular24Black.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
  }
}