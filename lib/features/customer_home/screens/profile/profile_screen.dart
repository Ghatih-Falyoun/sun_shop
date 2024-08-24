import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().loadProfileScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hello world');
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
                  Text('Profile', style: textStyles.medium32Black),
                  SizedBox(
                    height: 32.h,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) =>
                        current is profileScreenloaded,
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return SizedBox.shrink();
                        },
                        ProfileScreenloaded: (user) {
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
                      context.read<HomeCubit>().makeAccountSupplier();
                      context.pushNamed(Routes.SupplierHomeScreen);
                    },
                    child: Text(
                      'Go To My Store',
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
