// ignore_for_file: avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/features/presentations/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import '../../../models/response/response_api.dart';
import '../../../provider/users_provider.dart';
import '../../../utils/my_colors.dart';

class UpdateProfileController {
  BuildContext? context;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  PickedFile? pickedFile;
  File? imageFile;
  Function? refresh;

  ProgressDialog? _progressDialog;
  bool isEnable = true;
  User? user;
  final SharedPref _sharedPref = SharedPref();


  Future? init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    _progressDialog = ProgressDialog(context: context);
    user = User.fromJson(await _sharedPref.read('user'));
    // ignore: use_build_context_synchronously
    usersProvider.init(context, sessionUser: user);
    
    nameController.text = user?.name ?? '';
    lastNameController.text = user?.lastname ?? '';
    phoneController.text = user?.phone ?? '';
    
    
    refresh();
   
  }

  void update() async {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();

    if (
        name.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty 
       ) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
    }


    if (imageFile == null) {
      MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Debes seleccionar una imagen');
      return;
    }

    _progressDialog!.show(max: 100, msg: 'Cargando Imagen...');
    isEnable = false;


    User myUser = User(
        id: user!.id,
        name: name,
        lastname: lastName,
        phone: phone,
        image: user!.image
        );



  Stream stream = await usersProvider.update(myUser, imageFile!);
  stream.listen((res) async { 
  _progressDialog!.close();

    ResponseApi? responseApi = ResponseApi.fromJson(json.decode(res));
    Fluttertoast.showToast(msg: responseApi.message!);
    if (responseApi.success == true){
      user = await usersProvider.getById(myUser.id!);//Obtienen usuario de base de datos 
      _sharedPref.save('user', user?.toJson());
        Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
    }else{
      isEnable = true;
    }


  });

  }

  Future selectImage(ImageSource imagesource) async {
    final pickedFile = await ImagePicker().pickImage(source: imagesource);
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    Navigator.pop(context!);
    refresh!();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: MyColors.primaryColor),
        onPressed: () {
          selectImage(ImageSource.gallery);
        },
        child: const Text('Galeria'));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera);
        },
        child: const Text('camara'));

    AlertDialog alertDialog = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: const Image(
                image: NetworkImage(
                    'http://vectips.com/wp-content/uploads/2017/03/project-preview-large-2.png'),
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
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
