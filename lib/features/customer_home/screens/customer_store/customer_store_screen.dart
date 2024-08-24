import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_state.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/category_name_and_suggestions.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/home_ui_desing.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/product_list_view.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/setup_loading_with_screen.dart';
import 'package:sun_shop/features/sinup/widgets/sinup_lisener_bloc.dart';

class CustomerStoreScreen extends StatefulWidget {
  VoidCallback onPresedToCart;
  CustomerStoreScreen({required this.onPresedToCart,super.key});

  @override
  State<CustomerStoreScreen> createState() => _CustomerStoreScreenState();
}

class _CustomerStoreScreenState extends State<CustomerStoreScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().loadStoreScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeUiDesing(
      child: Column(
        children: [
          CategoryNameAndSuggestions(
            onpresedToCart: () => widget.onPresedToCart(),
            categoryName: 'Trend',
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is homeScreenError ||
                current is homeScreenLoading ||
                current is homeScreenloaded,
            builder: (context, state) {
              return state.maybeWhen(
                  HomeScreenloaded: (products) => ProductListView(products),
                  HomeScreenloading: () => setupLoadingWithScreen(),
                  HomeScreenerror: (error) {
                    return SizedBox.shrink();
                  },
                  orElse: () {
                    return SizedBox.shrink();
                  });
            },
          )
        ],
      ),
    );
  }
}
