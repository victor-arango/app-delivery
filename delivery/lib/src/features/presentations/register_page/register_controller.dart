// ignore_for_file: avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/features/presentations/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/response/response_api.dart';
import '../../../provider/users_provider.dart';
import '../../../utils/my_colors.dart';


class RegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  PickedFile? pickedFile;
  File? imageFile;
  Function? refresh;

  Future? init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
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

    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    } else {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Debes ingresar un correo electronico valido');
      return;
    }

    User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password);

    ResponseApi? responseApi = await usersProvider.create(user);

    MySnackbarResponseApi.show(
        context: context,
        title: responseApi?.success,
        contentType: responseApi?.success,
        text: responseApi?.message);

    if (responseApi?.success == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context!, 'login');
      });
    } else {}
  }


Future selectImage(ImageSource imagesource) async{
  PickedFile pickedFile = (await ImagePicker().pickImage(source: imagesource)) as PickedFile;
  // ignore: unnecessary_null_comparison
  if (pickedFile != null) {
    imageFile = File(pickedFile.path);
  }
  Navigator.pop(context!);
  refresh!();
}
 

  void showAlertDialog(){
    Widget galleryButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor:MyColors.primaryColor),
      onPressed: (){},  child: const Text('Galeria'));
    Widget cameraButton = ElevatedButton(onPressed: (){},  child: const Text('camara'));

    AlertDialog alertDialog = AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const  Image(
                    image: NetworkImage('http://vectips.com/wp-content/uploads/2017/03/project-preview-large-2.png'),
                    width: 130,
                    height: 130,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: headerText(
                      text: 'Selecciona tu imagen',
                      color: MyColors.primaryColorDark,
                      fontSize: 20.0),
                ),
              ],
            ),
          ),
          actions: [
            galleryButton,
            cameraButton
          ],
    );

    showDialog(context: context!, 
    builder: (BuildContext context){
      return alertDialog;
    });

  }



}
