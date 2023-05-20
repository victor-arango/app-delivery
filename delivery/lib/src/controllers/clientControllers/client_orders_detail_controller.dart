// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:delivery/src/pages/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/orders_provider.dart';
import 'package:delivery/src/provider/users_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';
class ClientOrderDetailController {
  BuildContext? context;
  Function? refresh;
  Product? product;
  User? user;
  int counter = 1;
  double productPrice = 0.0;
  final SharedPref _sharedPref = SharedPref();
  double total = 0.0;
  Order? order;
  List<User> users =[];
  final UsersProvider _usersProvider = UsersProvider();
  final OrdersProvider _ordersProvider = OrdersProvider();
  String idDelivery = '';

  Future<void> init(BuildContext context, Function refresh, Order order) async {
    this.context = context;
    this.refresh = refresh;
    this.order = order;
  
    user = User.fromJson(await _sharedPref.read('user'));
    _usersProvider.init(context, sessionUser: user);
    _ordersProvider.init(context, sessionUser: user);
    getTotal();
    await getUser();
    refresh();
  }

  Future<void> getUser() async {
    List<User?> deliveryMen = await _usersProvider.getDeliveryMen();
    users = deliveryMen.whereType<User>().toList();
    refresh!();
  }


void updateOrder() async {
    Navigator.pushNamed(context!, 'client/orders/map', arguments: order!.toJson());

 
}



  void getTotal() {
    total = 0;
    (order?.products ?? []).forEach((product) {
      total = total + ((product.price! )* (product.quantify!));
    });

    refresh!();
  }
}

