import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class IncreaseOrDecreaseAndPrice extends StatefulWidget {
  int count;
  double price;
  VoidCallback increaseItem;
  IncreaseOrDecreaseAndPrice(this.count,
      {required this.increaseItem, required this.price, super.key});
  @override
  State<IncreaseOrDecreaseAndPrice> createState() =>
      _IncreaseOrDecreaseAndPriceState();
}

class _IncreaseOrDecreaseAndPriceState
    extends State<IncreaseOrDecreaseAndPrice> {
  @override
  Widget build(BuildContext context) {
    double totalprice = widget.count * widget.price;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff2D4A98), width: 3),
                borderRadius: BorderRadius.circular(10000)),
            width: 160,
            height: 50,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svgs/minus.svg',
                      width: 20,
                    )),
                const VerticalDivider(
                  color: Colors.black,
                  width: 0,
                ),
                SizedBox(width: 15.w),
                SizedBox(
                    width: 20,
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.count.toString(),
                      style: textStyles.reqular16Black,
                    )),
                SizedBox(width: 15.w),
                const VerticalDivider(
                  color: Colors.black,
                  width: 0,
                ),
                IconButton(
                    onPressed: () {
                      widget.increaseItem();
                      setState(() {
                        print('increaseing');
                        widget.count = widget.count++;
                      });
                    },
                    icon: SvgPicture.asset(
                      'assets/svgs/decrease.svg',
                      width: 20,
                    )),
              ],
            ),
          ),
          Text(
            '\$${totalprice}',
            style: textStyles.bold24Gray.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
