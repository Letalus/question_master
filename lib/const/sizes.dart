import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight = 0;
  static double screenWidth = 0;
  static TileSize tile = TileSize();

  static void init(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}

class TileSize {
  final double margin = 24.0;
  final double borderRadius = 20;
  final double elevation = 8;
}