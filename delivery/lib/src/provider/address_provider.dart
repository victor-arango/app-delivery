// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print
import 'dart:convert';

import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/address/address.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class AddressProvider{

  String _url = Environment.API_DELIVERY;
  String _api = '/api/address';

  BuildContext? context;
  User? sessionUser;

    Future? init(BuildContext context, {User? sessionUser}) {
    this.context = context;
    this.sessionUser = sessionUser;

  }

  Future<List<Address>> getByUser(String idUser)async{
    try{  
      
      Uri url = Uri.http(_url, '$_api/findByUser/$idUser');
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
      Address address = Address.fromJsonList(data);
      return address.toList;


    }catch(e){
      print('Error $e');
      return [];
    }

  }

    Future<ResponseApi?> create(Address address) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(address);
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