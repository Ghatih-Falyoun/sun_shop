import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';

class customAppRow extends StatelessWidget {
  VoidCallback onPressed;
  String massageText;
  String buttonText;
  customAppRow({required this.massageText,required this.buttonText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.h,left: 12.h, top: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          Row(
            children: [
              Text(
                massageText,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10.w,
              ),
              TextButton(
                onPressed: () => onPressed(),
                child: Text(buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xffEBFFD2))),
              ),
              SizedBox(
                width: 20.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
