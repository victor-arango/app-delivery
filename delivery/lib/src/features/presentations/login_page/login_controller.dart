// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'sing-up');
  }

  void goToForgotPassword() {
    Navigator.pushNamed(context!, 'forgot-password');
  }

  void login() {
    Navigator.pushNamed(context!, 'tabs');
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('EMAIL: $email');
    print('PASSWORD: $password');
  }
}
