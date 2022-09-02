import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? textScaleFactor;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    textScaleFactor = _mediaQueryData.textScaleFactor;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 926.0) * screenHeight!;
}

double getProportionateFontSize(double inputFontSize) {
  double? textScale = SizeConfig.textScaleFactor;
  // 812 is the layout height that designer use
  return inputFontSize * textScale!;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 428.0) * screenWidth!;
}
