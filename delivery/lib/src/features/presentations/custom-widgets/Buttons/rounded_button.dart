import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';

Widget createButton(
    {BuildContext? context,
    double width = 350.0,
    double height = 45.0,
    double radius = 20.0,
    bool isWithIcon = false,
    ImageProvider<Object>? icon,
    String? labelButton,
    Color labelButtonColor = Colors.white,
    double labelFontSize = 15.0,
    Color? buttonColor,
    OutlinedBorder? shape,
    Function? func}) {
  return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 30.0),
      child: isWithIcon
          ? _elevationButtonWithIcon(radius, icon!, labelButton!,
              labelButtonColor, labelFontSize, buttonColor!, shape, func)
          : _elevationButtonNotIcon(radius, labelButton!, labelButtonColor,
              labelFontSize, buttonColor!, shape, func));
}

Widget _elevationButtonWithIcon(
    double radius,
    ImageProvider<Object> icon,
    String labelButton,
    Color labelButtonColor,
    double labelFontSize,
    Color color,
    OutlinedBorder? shape,
    Function? func) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: color, shape: shape, elevation: 0.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: icon,
            width: 20.0,
            height: 20.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: headerText(
              text: labelButton,
              color: labelButtonColor,
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget _elevationButtonNotIcon(
    double radius,
    String labelButton,
    Color labelButtonColor,
    double labelFontSize,
    Color color,
    OutlinedBorder? shape,
    Function? func) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: color, shape: shape, elevation: 0.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: headerText(
              text: labelButton,
              color: labelButtonColor,
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
