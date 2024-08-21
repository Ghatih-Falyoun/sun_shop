import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';

class GradientButton extends StatelessWidget {
  String text;
  TextStyle textStyle;
  VoidCallback onPressed;
  int width;
  int height;

  GradientButton(
      {required this.textStyle,
      required this.height,
      required this.width,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [colorManager.primary, Colors.white]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: width.w,
              height: height.h,
              alignment: Alignment.center,
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ));
  }
}
