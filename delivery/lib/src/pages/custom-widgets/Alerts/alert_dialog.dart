import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';
import '../Headers/header_text.dart';

Future showAlertDialog(BuildContext context, ImageProvider<Object> imagePath,
    String headerTitle, String headerSubTitle, Widget doneButton) async {
  await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SizedBox(
            height: 350,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Image(
                    image: imagePath,
                    width: 130,
                    height: 130,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: headerText(
                      text: headerTitle,
                      color: MyColors.primaryColorDark,
                      fontSize: 20.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    headerSubTitle,
                    style: TextStyle(
                        color: MyColors.primaryColorDark,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                ),
                doneButton
              ],
            ),
          ),
        );
      });
}
