import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/pages/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/category/category.dart';

import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/categories_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';


import 'package:flutter/material.dart';




class RestaurantCategoriController{
  BuildContext? context;
  Function? refresh;


  TextEditingController nameController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  final CategoriesProvider _categoriesProvider = CategoriesProvider ();
  User? user;
  final SharedPref _sharedPref = SharedPref();



 Future init(BuildContext context, Function refresh)async{
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    // ignore: use_build_context_synchronously
    _categoriesProvider.init(context, sessionUser: user );
    refresh();
   

  }

  void createCategory() async{
    String name = nameController.text;
    String description = descripcionController.text;
   

    if( name.isEmpty || description.isEmpty){
        MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
    }

    Category category = Category(
      name: name,
      description: description
    );
 


    
    ResponseApi? responseApi = await _categoriesProvider.create(category);

    MySnackbarResponseApi.show(
          context: context,
          title: responseApi?.success,
          contentType: responseApi?.success,
          text: responseApi?.message);


    if(responseApi!.success == true){

    nameController.text = '';
    descripcionController.text = '';

    }



  }


  




}