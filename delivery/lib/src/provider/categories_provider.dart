// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print
import 'dart:convert';

import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/category/category.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class CategoriesProvider{

  String _url = Environment.API_DELIVERY;
  String _api = '/api/categories';

  BuildContext? context;
  User? sessionUser;

    Future? init(BuildContext context, {User? sessionUser}) {
    this.context = context;
    this.sessionUser = sessionUser;

  }

  Future<List<Category>> getAll()async{
    try{  
      Uri url = Uri.http(_url, '$_api/getAll');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.get(url, headers: headers);
      if(res.statusCode == 401){ //No autorizado
      Fluttertoast.showToast(msg: 'La sesion Expiro');
      SharedPref().logout(context!, sessionUser!.id.toString());
      return [];
      }

      final data = jsonDecode(res.body);
      Category category = Category.fromJsonList(data);
      return category.toList;


    }catch(e){
      print('Error $e');
      return [];
    }

  }

    Future<ResponseApi?> create(Category category) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(category);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      if(res.statusCode == 401){ //No autorizado
      Fluttertoast.showToast(msg: 'La sesion Expiro');
      SharedPref().logout(context!, sessionUser!.id.toString());
      return null;
      }
      final data = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;

    } catch (e) {
      print('Error: $e');
      return null;
    }
  }





}