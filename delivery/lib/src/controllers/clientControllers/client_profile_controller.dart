


import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../models/users/user.dart';



class ClientProfileController{
  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Function? refresh;

  User? user;

 Future init(BuildContext context, Function refresh)async{
    this.context = context;
    this.refresh = refresh;
    user =User.fromJson(await _sharedPref.read('user'));
    refresh();
  }


  void logout(){
  
    _sharedPref.logout(context!,user!.id.toString());
  }

  void goToRoles(){
    Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
  }

}