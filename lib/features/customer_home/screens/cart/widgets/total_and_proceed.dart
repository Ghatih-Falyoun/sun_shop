import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';

class TotalAndProceed extends StatelessWidget {
  double total;
  TotalAndProceed(this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.h, top: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'items',
              style: textStyles.reqular20Gray,
            ),
            SizedBox(
              width: 110.w,
              child: Text(
                textAlign: TextAlign.center,
                '\$$total',
                style: textStyles.reqular16Black
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ]),
          GradientButton(
              textStyle: textStyles.reqular24Black
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              height: 62,
              width: 220,
              text: 'Proceed to checkout',
              onPressed: () {})
        ],
      ),
    );
  }
}
