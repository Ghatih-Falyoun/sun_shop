import 'package:flutter/material.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/features/customer_home/screens/cart/wishlist_screen.dart';
import 'package:sun_shop/features/customer_home/screens/profile/profile_screen.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/customer_store_screen.dart';
import 'package:sun_shop/features/customer_home/widgets/custom_navig_bar.dart';
import 'package:sun_shop/features/supplier_home/cus_bottom_navigation.dart';
import 'package:sun_shop/features/supplier_home/screens/profile/supplier_profile_screen.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/ui/proudct_upload_screen.dart';
import 'package:sun_shop/features/supplier_home/screens/my_store/my_store_screen.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    MyStoreScreen(),
    //WishlistScreen(),
    ProudctUploadScreen(),
    SupplierProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorManager.grayWith,
        bottomNavigationBar: CusBottomNavigation(
            (index) => setState(() => _onItemTapped(index))),
        body: _screens[_selectedIndex]);
  }
}
