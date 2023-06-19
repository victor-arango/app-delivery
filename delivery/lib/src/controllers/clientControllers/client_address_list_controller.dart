// ignore_for_file: use_build_context_synchronously


import 'package:delivery/src/models/address/address.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/address_provider.dart';
import 'package:delivery/src/provider/orders_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientAddressListcontroller{
  BuildContext? context;
  Function? refresh;
  List<Address> address = [];
  final AddressProvider _addressProvider = AddressProvider();
  User? user;
  final SharedPref _sharedPref = SharedPref();
  User? userId;




   int radioValue = 0;
     List<Product> selectedProducts = [];

     final OrdersProvider _ordersProvider = OrdersProvider();





  Future<void> init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user =User.fromJson(await _sharedPref.read('user'));
    userId =User.fromJson(await _sharedPref.read('user'));

    _addressProvider.init(context, sessionUser: user);
    _ordersProvider.init(context, sessionUser: user);
    // _sharedPref.remove('order');
      var orderData = await _sharedPref.read('order');
    selectedProducts = orderData != null
        ? Product.fromJsonList(orderData).toList
        : [];

      refresh();

  }
  void createOrder() async{
       Address a = Address.fromJson(await _sharedPref.read('address') ?? {});
    Order order = Order(
      idClient: user?.id,
      idAddress: a.id,
      products: selectedProducts 
    );
    ResponseApi? responseApi = await _ordersProvider.create(order);
  
    if(responseApi != null &&  responseApi.success == true){
      // Fluttertoast.showToast(msg: 'Se creo correctamente la orden');
      // _sharedPref.remove('order');
     await Navigator.pushNamedAndRemoveUntil(context!, 'client/payments/create', (route) => false);
    }
  }


  void handleRadioValueChange(int value) async{
    radioValue = value;
    _sharedPref.save('address', address[value]);

   
    refresh!();
   

  }

  


  Future<List<Address>> getAddress(String idUser) async{
   if (user != null) {
  address = await _addressProvider.getByUser(user!.id.toString());
   Address a = Address.fromJson(await _sharedPref.read('address') ?? {});
    int index = address.indexWhere((ad) => ad.id == a.id);

    if (index != -1){
      radioValue = index;
    }
  
   return address;
} else {

  return address = [];
}


  }





  void goToNewAddress()async{
  var  result = await Navigator.pushNamed(context!, 'client/address/create');
    if (result != null ){
      if (result == true){
        refresh!();
      }
    }
  }
} 