import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/pages/client/address/list/client_address_list_page.dart';
import 'package:delivery/src/pages/client/address/list/create/client_address_create_page.dart';
import 'package:delivery/src/pages/client/address/list/order_tab_client.dart';
import 'package:delivery/src/pages/client/address/map/client_address_map_page.dart';
import 'package:delivery/src/pages/client/list/tabs/client_products_list_page.dart';
import 'package:delivery/src/pages/delivery/orders/list/delivery_order_list_page.dart';
import 'package:delivery/src/pages/delivery/orders/map/delivery_orders_map_page.dart';
import 'package:delivery/src/pages/global/register_page.dart';
import 'package:delivery/src/pages/restaurant/orders/list/categories/create/restaurant_categories_create_page.dart';
import 'package:delivery/src/pages/restaurant/orders/list/products/create/restaurant_products_create_page.dart';
import 'package:delivery/src/pages/restaurant/orders/list/restaurants_orders_list_page.dart';


import 'package:delivery/src/pages/roles/roles_page.dart';
import 'package:flutter/widgets.dart';

//Pages
import 'package:delivery/src/pages/global/welcome_page.dart';
import 'package:delivery/src/pages/global/login_page.dart';
import '../pages/global/profile_detail_page.dart';
import '../models/address/address.dart';
import '../models/users/user.dart';
import '../pages/client/address/map/client_orders_map_page.dart';
import '../pages/client/list/tabs/my_order_tab/View/my_order_tab_client.dart';

class DeliveryOrdersMapPageArguments {
  final int id;
  final int idClient;
  final int idAddress;
  final String status;
  final double? lat;
  final double? lng;
  final int timestamp;
  final List<Product> products;
  final User client;
  final User delivery;
  final Address address;
  final int idDelivery;

  DeliveryOrdersMapPageArguments({
    required this.id,
    required this.idClient,
    required this.idAddress,
    required this.status,
    required this.timestamp,
    required this.products,
    required this.client,
    required this.delivery,
    required this.address,
    required this.idDelivery,
    this.lat,
    this.lng,
  });

  get order => null;
}



final Map<String, WidgetBuilder> routes = {
  'welcome': (BuildContext context) => const WelcomePage(),
  'login': (BuildContext context) => const LoginPage(),
  'sing-up': (BuildContext context) => const RegisterPage (),

  
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
  // Rutas Restaurante  y delivery

  // 'client/products/list': (BuildContext context) => const TabsPageClient(),
  // 'restaurant/order/list': (BuildContext context) => const TabsPageClient(),
  'client/products/list':(BuildContext context) => const TabsPageClient(),
  'client/order/create': (BuildContext context) => const MyOrderTabClient(),
  'client/address/list': (BuildContext context) => const ClientAddressListPage(),
  'client/address/create': (BuildContext context) => const ClientAddressCreatePage(),
  'client/address/map': (BuildContext context) => const ClientAddressMapPage(),
  'client/orders/list': (BuildContext context) => const OrderProductTabClient(),
  'client/orders/map': (BuildContext context) => const ClientOrdersMapPage(),



  'restaurant/order/list':(BuildContext context) => const TabsPageRestaurant(),
  'restaurant/order/categories':(BuildContext context) => const RestaurantCategoriesCreatePage(),
  'restaurant/order/products':(BuildContext context) =>  const  RestaurantProductsCreatePage(),
  'delivery/order/list': (BuildContext context) =>const TabsPagedelivery(),
  'delivery/order/map': (BuildContext context) =>const DeliveryOrdersMapPage(),
  'roles': (BuildContext context) => const RolesPage(),

};
