// ignore_for_file: avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/features/presentations/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:flutter/material.dart';
import '../../../models/response/response_api.dart';
import '../../../provider/users_provider.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        // lastName.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
    }

    if (confirmPassword != password) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'La contraseña debee tener al menos 6 caracteres');
      return;
    }

    User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password);

    print(email);
    print(name);
    print(lastName);
    print(phone);
    print(password);
    print(confirmPassword);

    ResponseApi? responseApi = await usersProvider.create(user);

    if (responseApi != null) {
      MySnackbar.show(
          context: context,
          title: 'Exito',
          contentType: ContentType.success,
          text: responseApi.message ?? 'se produjo un error');
    } else {
      MySnackbar.show(
          context: context,
          title: 'Error',
          contentType: ContentType.failure,
          text: 'Se produjo un error vuelve a intentarlo');
    }
  }
}
