// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/category/category.dart';
import 'package:delivery/src/models/product/product.dart';

import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/categories_provider.dart';
import 'package:delivery/src/provider/products_provider.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:extended_masked_text/extended_masked_text.dart';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';







class RestaurantProductController{
  BuildContext? context;
  Function? refresh;


  TextEditingController nameController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  MoneyMaskedTextController priceController = MoneyMaskedTextController();

  final CategoriesProvider _categoriesProvider = CategoriesProvider ();
  final ProductsProvider _productsProvider = ProductsProvider();
  User? user;
  final SharedPref _sharedPref = SharedPref();
  List<Category> categories = [];
  String? idCategory ;




  //Imagenes 

  PickedFile? pickedFile;
  File? imageFile1;
  File? imageFile2;
  File? imageFile3;

  ProgressDialog? _progressDialog;



 Future init(BuildContext context, Function refresh)async{
    this.context = context;
    this.refresh = refresh;
    _progressDialog = ProgressDialog(context: context);
    user = User.fromJson(await _sharedPref.read('user'));
    // ignore: use_build_context_synchronously
    _categoriesProvider.init(context, sessionUser: user );
    _productsProvider.init(context, sessionUser: user);

    getCategorires();
    refresh();
   
 
  }



  void getCategorires()async{
    categories = await _categoriesProvider.getAll();
    refresh;
    
  }

  void createProduct() async{
    String name = nameController.text;
    String description = descripcionController.text;
    double price = priceController.numberValue;
  
   

    if( name.isEmpty || description.isEmpty  || price == 0 ){
        MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
    }

    if(imageFile1 == null || imageFile2 == null || imageFile3 ==null ){
        MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Selecciona las imagenes');
      return;
    }


    if ( idCategory == null){
       MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'No has seleccionado la categoria del producto');
      return;
    }


    Product product = Product(
      name: name,
      description: description,
      price: price,
      idCategory: int.parse(idCategory!)
    );


    List<File> images = [];
    images.add(imageFile1!);
    images.add(imageFile2!);
    images.add(imageFile3!);


    _progressDialog!.show(max: 100, msg: 'Cargando producto');


    Stream stream = await _productsProvider.create(product, images);
    stream.listen((res) {
      _progressDialog!.close();

      ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
       MySnackbarResponseApi.show(
          context: context,
          title: responseApi.success,
          contentType: responseApi.success,
          text: responseApi.message);

          if(responseApi.success == true){

            resetValues();

           }

      
    });

  }
      void resetValues(){
    nameController.text ='';
    descripcionController.text='';
    priceController.text='0.0';
    imageFile1 = null;
    imageFile2 = null;
    imageFile3 = null;
    idCategory = null;
    refresh!();
   }

   

    Future selectImage(ImageSource imagesource, int numberFile) async {
    final pickedFile = await ImagePicker().pickImage(source: imagesource);
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      if(numberFile == 1){
      imageFile1 = File(pickedFile.path);
      }
      else if(numberFile == 2){
        imageFile2 = File(pickedFile.path);
      }
      else if(numberFile == 3){
        imageFile3 = File(pickedFile.path);
      }
    }
    Navigator.pop(context!);
    refresh!();
  }

  void showAlertDialog(int numberFile) {
    Widget galleryButton = ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: MyColors.primaryColor),
        onPressed: () {
          selectImage(ImageSource.gallery, numberFile);
        },
        child: const Text('Galeria'));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera, numberFile);
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