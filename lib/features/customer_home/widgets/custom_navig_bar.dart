import 'package:flutter/material.dart';
import 'package:sun_shop/core/theme/color_manager.dart';

class customNavigBar extends StatefulWidget {
  ValueSetter<int> onTap;
  customNavigBar(this.onTap, {super.key});

  @override
  State<customNavigBar> createState() => _customNavigBarState();
}

class _customNavigBarState extends State<customNavigBar> {
    int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 183, 218, 47),
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      onTap: (value) {
        setState(() {
        _currentIndex = value;
        });
        widget.onTap(value);
        
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'store'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: 'profile'),
      ],
    );
  }
}
