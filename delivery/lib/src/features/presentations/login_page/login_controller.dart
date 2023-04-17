// ignore_for_file: unused_local_variable, avoid_print

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/users_provider.dart';
import 'package:flutter/material.dart';

import '../../../models/response/response_api.dart';
import '../custom-widgets/my_snackbar.dart';

// ignore: camel_case_types
class loginController {
  BuildContext? context;
  dynamic user;
  String? ruta;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);

    return null;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'sing-up');
  }

  void goToForgotPassword() {
    Navigator.pushNamed(context!, 'forgot-password');
  }

  void login() async {
    // Navigator.pushNamed(context!, 'tabs');
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
    }

    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    } else {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Debes ingresar un correo electronico valido');
      return;
    }

    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi?.success != null && responseApi?.success == true) {
      User user = User.fromJson(responseApi?.data);

      if (user.roles!.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      } else {
        ruta = user.roles![0].route!.toString();
        Navigator.pushNamedAndRemoveUntil(context!, ruta!, (route) => false);

        print(ruta);
      }
    } else {
      MySnackbarResponseApi.show(
          context: context,
          title: responseApi?.success,
          contentType: responseApi?.success,
          text: responseApi?.message);
    }
  }
}
