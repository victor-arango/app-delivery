// ignore_for_file: use_build_context_synchronously

import 'package:delivery/src/models/category/category.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/pages/client/list/tabs/detail/client_products_detail_page.dart';
import 'package:delivery/src/provider/categories_provider.dart';
import 'package:delivery/src/provider/products_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../models/users/user.dart';



class ClientProductsListController{
  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Function? refresh;
  User? user;
  final CategoriesProvider _categoriesProvider = CategoriesProvider();
  final ProductsProvider _productsProvider = ProductsProvider();
  List<Category> categories = [];

 Future init(BuildContext context, Function refresh)async{
    this.context = context;
    this.refresh = refresh;
    user =User.fromJson(await _sharedPref.read('user'));
    _categoriesProvider.init(context, sessionUser: user);
    _productsProvider.init(context,sessionUser: user);
    getCategorires();
    refresh();
  }

  void openBottomSheet(Product product){
    showMaterialModalBottomSheet(
      context: context!,  
     builder:(context) =>  ClientProductsDetailPage(product: product)
     );
     refresh!();
  }
  Future<List<Product>> getProducts(String idCategory)async{
    return await _productsProvider.getByCategory(idCategory);
    }
  void getCategorires() async{
    categories = await _categoriesProvider.getAll();
    refresh!();
  }
   void goToOrderPage(){
    Navigator.pushNamed(context!, '');
  }
}