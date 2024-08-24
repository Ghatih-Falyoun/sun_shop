import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/text_form_field.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_cubit.dart';

class ProudctUploadScreen extends StatelessWidget {
  const ProudctUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.h),
          child: Column(
            children: [
              Form(
                key: context.read<SupplierHomeCubit>().key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'Enter your Product',
                      style: textStyles.reqular24Black,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    AppTextFormField(
                      hintText: 'Product Name',
                      validator: (v) {
                        return validator(v);
                      },
                      controller:
                          context.read<SupplierHomeCubit>().nameTextEditor,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextFormField(
                      hintText: 'Description',
                      controller: context
                          .read<SupplierHomeCubit>()
                          .descriptionTextEditor,
                      validator: (v) {
                        return validator(v);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextFormField(
                        hintText: 'Category',
                        validator: (v) {
                          return validator(v);
                        },
                        controller: context
                            .read<SupplierHomeCubit>()
                            .categoryTextEditor),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextFormField(
                      hintText: 'Price',
                      validator: (v) {
                        return validator(v);
                      },
                      isInputNumber: true,
                      controller:
                          context.read<SupplierHomeCubit>().priceTextEditor,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextFormField(
                        hintText: 'Stock',
                        validator: (v) {
                          return validator(v);
                        },
                        isInputNumber: true,
                        controller:
                            context.read<SupplierHomeCubit>().stockTextEditor),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (context
                            .read<SupplierHomeCubit>()
                            .key
                            .currentState!
                            .validate()) {
                          context.read<SupplierHomeCubit>().addProduct();
                        }
                        ;
                      },
                      style: const ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(double.infinity, 50),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(colorManager.primary)),
                      child: const Text(
                        'Add',
                        style: textStyles.reqular24Black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validator(String? value) {
    return value == null || value.isEmpty
        ? 'Pleas don\'t let it empty' : null
        ;
  }
}
