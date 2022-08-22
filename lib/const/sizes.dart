import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight = 0;
  static double screenWidth = 0;

  static void init(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

}