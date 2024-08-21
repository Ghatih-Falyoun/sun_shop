import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';
import 'package:sun_shop/core/widgets/text_form_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _key = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Form(
          key: _key,
          child: Column(
            children: [
              AppTextFormField(
                controller: emailController,
                hintText: 'Enter you Email',
                validator: (p0) {},
              ),
              SizedBox(
                height: 33.h,
              ),
              AppTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  validator: (p0) {}),
              SizedBox(
                height: 33.h,
              ),
              GradientButton(
                  textStyle: textStyles.reqular24Black,
                  height: 62,
                  width: 380,
                  text: 'Log in',
                  onPressed: () {})
            ],
          )),
    );
  }
}
