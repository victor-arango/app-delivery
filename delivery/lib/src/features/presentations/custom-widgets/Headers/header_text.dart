import 'package:flutter/material.dart';

Widget headerText(
    {String text = "",
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    double? fontSize,
    TextAlign? textAlign,
    dynamic  maxLines = 1,
    dynamic textOverflow = TextOverflow.visible 
    
    }) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: textOverflow,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      
      
    ),

  
  );
}
