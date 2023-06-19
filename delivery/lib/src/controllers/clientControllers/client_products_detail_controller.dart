import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientProductsDetailController {
  BuildContext? context;
  Function? refresh;
  Product? product;
  int counter = 1;
  double productPrice = 0.0;
  final SharedPref _sharedPref = SharedPref();
  List<Product> selectedProducts = [];

  Future<void> init(BuildContext context, Function refresh, Product product) async {
    this.context = context;
    this.refresh = refresh;
    this.product = product;
    productPrice = product.price!;
    var orderData = await _sharedPref.read('order');
    selectedProducts = orderData != null
        ? Product.fromJsonList(orderData).toList
        : [];
    // Verificar que todos los productos tengan un valor inicial para "quantify"
    for (var product in selectedProducts) {
      product.quantify ??= 1;
    }
//  print('Productos Seleccionados ${product.toJson()}');
    refresh();
  }
void addToBag() {
  int index = selectedProducts.indexWhere((p) => p.id == product!.id);
  if (index == -1) {
    // El producto seleccionado no existe en el carrito
    product!.quantify = counter;
    selectedProducts.add(product!);
  } else {
    // El producto ya existe en el carrito, actualizar la cantidad
    selectedProducts[index].quantify =
        selectedProducts[index].quantify! + counter;
  }
  _sharedPref.save('order', selectedProducts);
  Fluttertoast.showToast(msg: 'Se agregó el producto');
}
  void addItem() {
    counter = counter + 1;
    productPrice = (product?.price)! * counter;
    product?.quantify = counter;
    refresh!();
  }
  void removeItem() {
    if (counter > 1) {
      counter = counter - 1;
      productPrice = (product?.price)! * counter;
      product?.quantify = counter;
      refresh!();
    }
  }
}

// import 'package:delivery/src/models/product/product.dart';
// import 'package:delivery/src/utils/shared_pref.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// class ClientProductsDetailController{
// BuildContext? context;
// Function? refresh;
// Product? product;

// int counter = 1;
// double productPrice = 0.0;
// final SharedPref _sharedPref = SharedPref();
// List<Product> selectedProducts = [];

// Future init(BuildContext context, Function refresh,Product product) async {
//   this.context = context;
//   this.refresh = refresh;
//   this.product = product;
//   productPrice = product.price!;
//   // _sharedPref.remove('order');
//   // print(_sharedPref.remove('order'));
//   var orderData = await _sharedPref.read('order');
//   selectedProducts = orderData != null ? Product.fromJsonList(orderData).toList : [];
//   selectedProducts.forEach((Product){
//   print('Productos Seleccionados ${product.toJson()}');
//   });
//   refresh();

// }

// void addToBag(){

//   int index = selectedProducts.indexWhere((p) => p.id == product!.id);
//   if(index == -1 ){ //PRODUCTO SELECCIONADO NO EXISTE 
//     if(product!.quantify == null){
//       product!.quantify = 1;
//     }
//     selectedProducts.add(product!);
//   }else{
//     selectedProducts[index].quantify = counter;
//   }
//   _sharedPref.save('order',selectedProducts);
//   Fluttertoast.showToast(msg: 'Se agrego el producto');


// }

// void addItem(){
//   counter = counter + 1;
//   productPrice = (product?.price)! * counter;
//   product?.quantify = counter;
//   print(product?.quantify);
//   refresh!();

// }
// void removeItem(){
//   if(counter > 1 ){
//   counter = counter - 1;
//   productPrice = (product?.price)! * counter;
//   product?.quantify = counter;
//   refresh!();
//   }

// }


// }

