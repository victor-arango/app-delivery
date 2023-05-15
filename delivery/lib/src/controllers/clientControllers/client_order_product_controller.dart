// ignore: file_names



// ignore_for_file: use_build_context_synchronously

import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/pages/client/address/list/orders/detail/client_orders_detail_page.dart';
import 'package:delivery/src/provider/orders_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../models/users/user.dart';



class ClientOrderProducController{
  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Function? refresh;

  User? user;

  List<String> status =['PAGADO','DESPACHADO', 'EN CAMINO', 'ENTREGADO'];

  final OrdersProvider _ordersProvider = OrdersProvider();
  bool? isUpdate;

 Future init(BuildContext context, Function refresh)async{
    this.context = context;
    this.refresh = refresh;

    user =User.fromJson(await _sharedPref.read('user'));
    _ordersProvider.init(context, sessionUser: user);
    refresh();
  }

 Future<List<Order>> getOrders(String status) async {
  if (user != null && user!.id != null) {
    return await _ordersProvider.getByClientAndstatus(user!.id!, status);
  } else {
    return [];
  }
}


  void openBottomSheet(Order order)async{
   isUpdate = await showMaterialModalBottomSheet(
      context: context!, 
      builder: (context) =>  ClientOrdersDetailPage(order: order)
      );
  
    if (isUpdate != null && isUpdate!) {
      refresh!();
}
  }



    void goToRoles(){
    Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
  }


}