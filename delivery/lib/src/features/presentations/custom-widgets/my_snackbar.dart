import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class MySnackbar {
  static void show(
      {BuildContext? context,
      String? text,
      String? title,
      ContentType? contentType}) {
    // ignore: unnecessary_null_comparison
    if (context == null) return;

    FocusScope.of(context).requestFocus(FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title!,
        message: text!,
        contentType: contentType!,
      ),
    ));
  }
}

class MySnackbarResponseApi {
  static void show(
      {BuildContext? context,
      String? text,
      bool? title = false,
      bool? contentType = false}) {
    // ignore: unnecessary_null_comparison
    if (context == null) return;

    FocusScope.of(context).requestFocus(FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title! ? 'Exito' : 'Error ',
        message: text!,
        contentType: contentType! ? ContentType.success : ContentType.failure,
      ),
    ));
  }
}
