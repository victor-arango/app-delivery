
// ignore_for_file: use_build_context_synchronously, file_names

import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/pages/restaurant/orders/detail/restaurant_orders_detail_page.dart';
import 'package:delivery/src/provider/orders_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../models/users/user.dart';



class RestaurantProfileController{
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

  Future<List<Order>> getOrders(String status)async{
    return await _ordersProvider.getBystatus(status);
  }

  void openBottomSheet(Order order)async{
   isUpdate = await showMaterialModalBottomSheet(
      context: context!, 
      builder: (context) => RestaurantOrdersDetailPage(order: order)
      );
  
    if (isUpdate != null && isUpdate!) {
      refresh!();
}
  }

  void logout(){
    _sharedPref.logout(context!, user!.id.toString());
  }

  void goToCategoriesCreate(){
    Navigator.pushNamed(context!, 'restaurant/order/categories');
  }
  void goToProductsCreate(){
    Navigator.pushNamed(context!, 'restaurant/order/products');
  }



    void goToRoles(){
    Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
  }


}