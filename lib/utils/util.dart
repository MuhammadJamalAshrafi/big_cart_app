import 'package:big_cart_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Util {
  static Color getCategoryColor(int id) {
    switch (id) {
      case 1:
        return const Color(0xFFE6F2EA);
      case 2:
        return const Color(0xFFFFE9E5);
      case 3:
        return const Color(0xFFFFF6E3);
      case 4:
        return const Color(0xFFF3EFFA);
      case 5:
        return const Color(0xFFDCF4F5);
      case 6:
        return const Color(0xFFFFE8F2);
      default:
        return const Color(0xFFFFFFFF);
    }
  }

  static String getCategoryIcon(int id) {
    switch (id) {
      case 1:
        return Constants.assets['vegetablesIcon']!;
      case 2:
        return Constants.assets['fruitsIcon']!;
      case 3:
        return Constants.assets['beveragesIcon']!;
      case 4:
        return Constants.assets['groceryIcon']!;
      case 5:
        return Constants.assets['edibleOilIcon']!;
      case 6:
        return Constants.assets['householdIcon']!;
      default:
        return "";
    }
  }
}
