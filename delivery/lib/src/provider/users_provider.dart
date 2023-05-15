// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../api/environment.dart';
import '../models/response/response_api.dart';
import '../models/users/user.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';



class UsersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  BuildContext? context;
  User? sessionUser;
  // String? token;



  Future? init(BuildContext context, {User? sessionUser}) {
    this.context = context;
    this.sessionUser = sessionUser;

  }


Future<User?> getById(String id) async{
  try{
     Uri url = Uri.http(_url, '$_api/findById/$id');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.get(url, headers: headers);
      if(res.statusCode == 401){ //No autorizado
      Fluttertoast.showToast(msg: 'La sesion Expiro');
      SharedPref().logout(context!, sessionUser!.id.toString());
      return null;
      }
      final data = json.decode(res.body);
      User user = User.fromJson(data);
     
      return user;

  }
  catch(e){
    print('Error: $e');
    return null;
  }
}

Future<List<User?>> getDeliveryMen() async{
  try{
     Uri url = Uri.http(_url, '$_api/findByDeliveryMen');
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
      final data = json.decode(res.body);
      User user = User.fromJsonList(data);
     
      return user.toList;

  }
  catch(e){
    print('Error: $e');
    return [];
  }
}


Future<Stream> createWithImage(User user, File image) async{


  try{

  
    Uri url = Uri.http(_url, '$_api/create');
  final request = http.MultipartRequest('POST', url);

  if (image != null){
    request.files.add(http.MultipartFile( 
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
  }

  request.fields['user'] = json.encode(user);
  final response = await request.send();

  if(response.statusCode == 401){
    Fluttertoast.showToast(msg: 'La sesion Expiro');
    SharedPref().logout(context!, sessionUser!.id.toString());
    return Stream.empty();
  }


  return response.stream.transform(utf8.decoder);
  }

  catch(e){
    print('Error: $e');
    return const Stream.empty();
  }


}

Future<Stream> update(User user, File image) async{
  try{
    Uri url = Uri.http(_url, '$_api/update');
  final request = http.MultipartRequest('PUT', url);
  request.headers['Authorization'] =sessionUser!.sessionToken.toString();
  if (image != null){
    request.files.add(http.MultipartFile( 
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
  }
 
  request.fields['user'] = json.encode(user);
  final response = await request.send();


  if(response.statusCode == 401){
   
    Fluttertoast.showToast(msg: 'La sesion Expiro');
    print('Entro al condicional');
    SharedPref().logout(context!, sessionUser!.id.toString());
     return const Stream.empty();
  }
  return response.stream.transform(utf8.decoder);
  }

  catch(e){
    print('Error: $e');
    return const Stream.empty();
  }


}

  Future<ResponseApi?> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);

      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }


  Future<ResponseApi?> logoutSesion(String idUser) async {
    try {
      Uri url = Uri.http(_url, '$_api/logout');
      String bodyParams = json.encode({
        'id': idUser
      });
      Map<String, String> headers = {
        'Content-type': 'application/json'
       
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      print('RES $res');
      print('DATA: $data');
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ResponseApi?> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
