// ignore_for_file: unused_import

import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class ClientOrderCreateController {
  BuildContext? context;
  Function? refresh;
  Product? product;
  
  User? user;

  int counter = 1;
  double productPrice = 0.0;

  final SharedPref _sharedPref = SharedPref();
  List<Product> selectedProducts = [];
  double total = 0.0;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    product = product;
     user =User.fromJson(await _sharedPref.read('user'));
    // productPrice = product.price!;

     var orderData = await _sharedPref.read('order');
    selectedProducts = orderData != null
        ? Product.fromJsonList(orderData).toList
        : [];
     
    getTotal();
    refresh();
  }

  void getTotal(){
    total =0;
    selectedProducts.forEach((product) {
      total =  total + ((product.quantify)! * product.price!);
     });

     refresh!();
  }

  void removeItem(Product product){
    
    int index = selectedProducts.indexWhere((p) => p.id == product.id);
    selectedProducts[index].quantify = (selectedProducts[index].quantify)! - 1;
    _sharedPref.save('order', selectedProducts);
    getTotal();

  }


  void addItem(Product product){
    if ((product.quantify)! > 1) {
      int index = selectedProducts.indexWhere((p) => p.id == product.id);
      selectedProducts[index].quantify = (selectedProducts[index].quantify)! + 1;
      _sharedPref.save('order', selectedProducts);
      getTotal();
    
    }

  }


  void deleteItem(Product product){

    selectedProducts.removeWhere((p) => p.id == product .id);
    _sharedPref.save('order',selectedProducts);
    getTotal();
  }

    void goToAddress(){
    Navigator.pushNamed(context!,'client/address/list');
  }



 
}

