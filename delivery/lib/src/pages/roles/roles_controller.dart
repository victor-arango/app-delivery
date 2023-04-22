import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RolesController{
  late BuildContext context;
  late Function refresh;
  User? user;
  SharedPref sharedPref = SharedPref();

  Future init(BuildContext context, Function refresh )async{
    this.context = context;
    
    user = User.fromJson( await sharedPref.read('user') ?? {});
    refresh();
  }
  void goToPage(String route){
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

}