import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class CategoryNameAndSuggestions extends StatelessWidget {
  String categoryName;
  VoidCallback onpresedToCart;
  CategoryNameAndSuggestions(
      {required this.onpresedToCart, required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryName,
              style: textStyles.blod48Black,
            ),
            IconButton(
              onPressed: () {
                onpresedToCart();
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(Size(50.w, 50.h))),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            suggestion(
              'New',
              () {},
            ),
            suggestion(
              'Trend',
              () {},
            ),
            suggestion(
              'Top',
              () {},
            ),
            suggestion(
              'viewd',
              () {},
            ),
          ],
        )
      ],
    );
  }

  Widget suggestion(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: textStyles.reqular16Black,
      ),
      style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(80.w, 40.h)),
          maximumSize: WidgetStatePropertyAll(Size(100.w, 40.h)),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)))),
          backgroundColor: const WidgetStatePropertyAll(Color(0xffF3FFBF))),
    );
  }
}
