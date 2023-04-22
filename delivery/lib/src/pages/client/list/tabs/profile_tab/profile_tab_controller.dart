


import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../../../../models/users/user.dart';


class ProfileController{
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
    _sharedPref.logout(context!);
  }

}