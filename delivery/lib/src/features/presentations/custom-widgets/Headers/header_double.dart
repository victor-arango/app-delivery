import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import 'header_text.dart';

Widget headerDoubleText(
    {required textHeader, required textAction, Function? func}) {
  return Row(
    children: [
      headerText(text: textHeader, fontSize: 20.0),
      const Spacer(),
      GestureDetector(
        onTap: () {
          func;
        },
        child: headerText(
            text: textAction,
            color: MyColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.0),
      )
    ],
  );
}
