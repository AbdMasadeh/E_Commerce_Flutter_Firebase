import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

var mainColor = Get.isDarkMode? Colors.grey[400]: Colors.red;
var backGroundColor = Get.isDarkMode? Colors.grey[600] : Colors.white;
var textColor = Get.isDarkMode? Colors.white : Colors.black;

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: mainColor,
    brightness: Brightness.dark,
  );
}