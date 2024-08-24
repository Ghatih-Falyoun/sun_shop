import 'package:flutter/material.dart';
import 'package:sun_shop/core/theme/color_manager.dart';

class textStyles {
  static const TextStyle medium32Black =
      TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500);
  static const TextStyle blod48Black =
      TextStyle(fontSize: 48, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle reqular24Black =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400);
  static const TextStyle reqular16Black =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);
  static const TextStyle reqular20Gray = TextStyle(
      fontSize: 20, color: colorManager.gray, fontWeight: FontWeight.w400);
  static const TextStyle reqular14lightGray = TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 150, 150, 150),
      fontWeight: FontWeight.w400);
  static const TextStyle bold24Gray = TextStyle(
      fontSize: 24, color: colorManager.gray, fontWeight: FontWeight.bold);
  static const TextStyle reqular12Black =
      TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400);
  static const TextStyle reqular16blue = TextStyle(
      fontSize: 24,
      color: Color(0xff2D4A98),
      fontWeight: FontWeight.w400);
}
