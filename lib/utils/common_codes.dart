import 'package:flutter/material.dart';
import 'package:iml_task/utils/size_config.dart';

Widget textWidget(
  String lable, {
  int? maxLines,
  TextStyle? style,
}) {
  return Text(
    lable,
    maxLines: maxLines,
    style: style,
  );
}

snackBar(context, {required String title}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: textWidget(title),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      margin: EdgeInsets.all(getProportionateScreenHeight(10)),
    ),
  );
}
