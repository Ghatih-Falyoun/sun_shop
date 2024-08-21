import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/app_regex.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';
import 'package:sun_shop/core/widgets/text_form_field.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_cubit.dart';

class EmailAndPasswordAndName extends StatelessWidget {
  EmailAndPasswordAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Form(
          key: context.read<SingupCubit>().key,
          child: Column(
            children: [
              AppTextFormField(
                controller: context.read<SingupCubit>().nameController,
                hintText: 'Enter you Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 33.h,
              ),
              AppTextFormField(
                controller: context.read<SingupCubit>().emailController,
                hintText: 'Enter you Email',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 33.h,
              ),
              AppTextFormField(
                controller: context.read<SingupCubit>().passwordController,
                hintText: 'Enter your password',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPasswordValid(value)) {
                    return 'Please enter Strong password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 33.h,
              ),
              GradientButton(
                  textStyle: textStyles.reqular24Black,
                  height: 62,
                  width: 380,
                  text: 'Sing up',
                  onPressed: () {
                    if (context
                        .read<SingupCubit>()
                        .key
                        .currentState!
                        .validate()) {
                      context.read<SingupCubit>().singup();
                      
                      print('its valid');
                    }
                  })
            ],
          )),
    );
  }
}
