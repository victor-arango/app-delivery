import 'package:flutter/material.dart';

Widget headerText(
    {String text = "",
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    double? fontSize,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}
