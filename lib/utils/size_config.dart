import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  return (inputHeight / 844) * SizeConfig.screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  return (inputWidth / 390) * SizeConfig.screenWidth;
}

sizeBoxHeight(double value) {
  return SizedBox(
    height: getProportionateScreenHeight(value),
  );
}

sizeBoxWidth(double value) {
  return SizedBox(
    width: getProportionateScreenWidth(value),
  );
}
