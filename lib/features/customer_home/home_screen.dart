import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_state.dart';
import 'package:sun_shop/features/customer_home/screens/cart/wishlist_screen.dart';
import 'package:sun_shop/features/customer_home/screens/profile/profile_screen.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/customer_store_screen.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/category_name_and_suggestions.dart';
import 'package:sun_shop/features/customer_home/widgets/custom_navig_bar.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/home_ui_desing.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/product_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // List of screens
  final List<Widget> _screens = [
    CustomerStoreScreen(onPresedToCart: () { 
    
    },),
    WishlistScreen(),
    ProfileScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorManager.grayWith,
        bottomNavigationBar:
            customNavigBar((index) => setState(() => _onItemTapped(index))),
        body: _screens[_selectedIndex]);
  }
}
