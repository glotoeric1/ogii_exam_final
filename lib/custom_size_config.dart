import 'package:flutter/material.dart';

class CustomSizedConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.width;
    screenWidth = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }

  double getProportionateScreenHeight(double inputHeight) {
    double? screenHeight = CustomSizedConfig.screenHeight!;
    return (inputHeight / 812.0) * screenHeight;
  }

  double getProportionateScreenWidth(double inputWidth) {
    double? screenWidth = CustomSizedConfig.screenWidth!;
    return (inputWidth / 375.0) * screenWidth;
  }
}
