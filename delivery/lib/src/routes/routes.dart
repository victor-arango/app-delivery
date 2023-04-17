import 'package:delivery/src/pages/delivery/orders/list/delivery_order_list_page.dart';
import 'package:delivery/src/pages/restaurant/orders/list/restaurants_orders_list.dart';
import 'package:delivery/src/pages/roles/roles_page.dart';
import 'package:flutter/widgets.dart';

//Pages
import 'package:delivery/src/features/presentations/welcome_page/View/welcome_page.dart';
import 'package:delivery/src/features/presentations/login_page/View/login_page.dart';
import 'package:delivery/src/features/presentations/forgot_password_page/View/forgot_password_page.dart';
import 'package:delivery/src/features/presentations/register_page/View/register_page.dart';
import 'package:delivery/src/features/presentations/tabs/tabs_page.dart';
import 'package:delivery/src/features/presentations/collections_page/View/collections_page.dart';
import 'package:delivery/src/features/presentations/search_page/View/search_view.dart';
import '../features/presentations/collections_detail_page/View/collection_detail_page.dart';
import '../features/presentations/filter_page/View/filter_page.dart';
import '../features/presentations/place_detail_page/View/place_detail_page.dart';
import '../features/presentations/profile_detail_page/View/profile_detail_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
  'login': (BuildContext context) => const LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sing-up': (BuildContext context) => const RegisterPage(),
  // 'tabs': (BuildContext context) => const TabsPage(),
  'client/products/list': (BuildContext context) => const TabsPage(),
  'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  'collections': (BuildContext context) => const CollectionsPage(),
  'collections-detail': (BuildContext context) => const CollectionsDetailPage(),
  'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
  // Rutas Restaurante  y delivery

  'restaurant/order/list': (BuildContext context) =>
      const RestaurantOrderListPage(),
  'delivery/order/list': (BuildContext context) =>
      const DeliveryOrdersListPage(),
  'roles': (BuildContext context) => const RolesPage(),
};
