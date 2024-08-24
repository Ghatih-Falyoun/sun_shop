import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/core/widgets/gradient_button.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_state.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/order_summary.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/prodduct_in_cash.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/total_and_proceed.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/wishlist_car_list_view.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().loadWishlistScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorManager.grayWith,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 16.0.h,
                  left: 16.0.h,
                  top: 16.w,
                ),
                child: const Text(
                  'Retail',
                  style: textStyles.reqular24Black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is wishlistScreenError ||
                    current is wishlistScreenloaded ||
                    current is wishlistScreenLoading,
                builder: (context, state) {
                  return state.maybeWhen(
                    WishlistScreenloading: () {
                      return setuploading();
                    },
                    WishlistScreenloaded: (products, total) {
                      return Column(
                        children: [
                          WishlistCarListView(
                              products: products,
                             ),
                          SizedBox(height: 20.h),
                          OrderSummary(),
                          TotalAndProceed(total)
                        ],
                      );
                    },
                    orElse: () {
                      return SizedBox.shrink();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class setuploading extends StatelessWidget {
  const setuploading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading Please Wait',
              style:
                  textStyles.medium32Black.copyWith(color: colorManager.gray),
            ),
            CircularProgressIndicator(
              color: colorManager.gray,
            )
          ],
        ),
      ),
    );
  }
}
