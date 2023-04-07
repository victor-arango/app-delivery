import 'package:flutter/material.dart';

Widget roundedButton(
    {BuildContext? context,
    double width = 350.0,
    double height = 45.0,
    double radius = 20.0,
    bool isWithIcon = false,
    ImageProvider<Object>? icon,
    String? labelButton,
    Color? color}) {
  return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 30.0),
      child: isWithIcon
          ? _elevationButtonWithIcon(radius, icon!, labelButton!, color!)
          : _elevationButtonNotIcon(radius, labelButton!, color!));
}

Widget _elevationButtonWithIcon(double radius, ImageProvider<Object> icon,
    String labelButton, Color color) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius))),
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
        SizedBox(
          child: Text(labelButton,
              style: const TextStyle(color: Colors.white, fontSize: 15.0)),
        )
      ],
    ),
  );
}

Widget _elevationButtonNotIcon(double radius, String labelButton, Color color) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Text(labelButton,
              style: const TextStyle(color: Colors.white, fontSize: 15.0)),
        )
      ],
    ),
  );
}
