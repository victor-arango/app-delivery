import 'package:flutter/material.dart';

class ProfileController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  // logout() {
  //   _sharedPref.remove('user');
  //   Navigator.pushNamed(context!, 'welcome');
  // }
}
