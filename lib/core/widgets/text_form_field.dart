import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),

          //Focus Border
          focusedBorder: focusedBorder ??
              const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color.fromARGB(255, 77, 95, 4),
                width: 1.3,
              )),

          //Reqular Border
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: colorManager.gray,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(16.0)),

          //Error Border
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          )),
          hintStyle: hintStyle ?? textStyles.reqular14lightGray,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white),
      obscureText: isObscureText ?? false,
      style: textStyles.reqular14lightGray.copyWith(color: Colors.black),
      validator: (value) {
        return validator(value);
      },
      
    );
  }
}
