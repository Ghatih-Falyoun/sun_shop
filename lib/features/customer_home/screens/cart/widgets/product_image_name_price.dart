import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class ProductImageNamePrice extends StatelessWidget {
  String productName;
  double price;
  ProductImageNamePrice({required this.price,required this.productName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.h, vertical: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/bag.png',
            width: 90,
            height: 90,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: textStyles.reqular16blue,
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                'Price : \$$price',
                style: textStyles.reqular24Black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
