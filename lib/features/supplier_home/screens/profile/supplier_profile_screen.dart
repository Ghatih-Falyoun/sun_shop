import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_cubit.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_state.dart';

class SupplierProfileScreen extends StatefulWidget {
  const SupplierProfileScreen({super.key});

  @override
  State<SupplierProfileScreen> createState() => _SupplierProfileScreenState();
}

class _SupplierProfileScreenState extends State<SupplierProfileScreen> {
  @override
  void initState() {
    context.read<SupplierHomeCubit>().loadProfileScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorManager.grayWith,
        body: Stack(
          children: [
            Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset('assets/images/profile_desing.png')),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Supplier Profile', style: textStyles.medium32Black),
                  SizedBox(
                    height: 32.h,
                  ),
                  BlocBuilder<SupplierHomeCubit, SupplierHomeState>(
                    buildWhen: (previous, current) =>
                        current is profileloaded,
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return SizedBox.shrink();
                        },
                        ProfileLoaded: (user) {
                          return Column(
                            children: [
                              Center(
                                child: SizedBox(
                                    width: 200.w,
                                    height: 200.h,
                                    child: ClipOval(
                                        child: Image.asset(
                                            'assets/images/person.jpg'))),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_outlined,
                                    size: 45,
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name',
                                          style: textStyles.reqular20Gray),
                                      Text(
                                        user.displayName ?? 'No name',
                                        style: textStyles.reqular24Black,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 45,
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Email',
                                          style: textStyles.reqular20Gray),
                                      Text(
                                        user.email!,
                                        style: textStyles.reqular24Black,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.HomeScreen);
                    },
                    child: Text(
                      'Go To Shop',
                      style: textStyles.blod48Black.copyWith(fontSize: 21),
                    ),
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(180.w, 60.h)),
                      backgroundColor:
                          WidgetStatePropertyAll(colorManager.primary),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                    ),
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
