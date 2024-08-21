import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';
import 'package:sun_shop/core/widgets/text_form_field.dart';

class EmailAndPasswordAndName extends StatelessWidget {
  const EmailAndPasswordAndName({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Form(
          child: Column(
        children: [
          AppTextFormField(
            controller: nameController,
            hintText: 'Enter you Name',
            validator: (p0) {},
          ),SizedBox(
            height: 33.h,
          ),
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
              SizedBox(height:  33.h,),
          GradientButton(textStyle: textStyles.reqular24Black, height: 62, width: 380, text: 'Sing up', onPressed: (){})
          
        ],
      )),
    );
  }
}