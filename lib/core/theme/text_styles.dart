import 'package:flutter/material.dart';
import 'package:sun_shop/core/theme/color_manager.dart';

class textStyles {
  static const TextStyle medium32Black =
      TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500);
  static const TextStyle reqular24Black =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400); 
      static const TextStyle reqular16Black =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);       
  static const TextStyle reqular20Gray =
      TextStyle(fontSize: 20, color: colorManager.gray, fontWeight: FontWeight.w400);   
  static const TextStyle reqular14lightGray =
      TextStyle(fontSize: 20, color: Color.fromARGB(255, 150, 150, 150), fontWeight: FontWeight.w400);     
}
