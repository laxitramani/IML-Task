import 'package:flutter/material.dart';
import 'package:iml_task/utils/size_config.dart';

class AppTextStyle {
  static TextStyle normalText(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: getProportionateScreenHeight(fontSize ?? 14),
      fontWeight: fontWeight,
      color: color,
    );
  }
}
