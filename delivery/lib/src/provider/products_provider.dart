// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ProductsProvider{
  String _url = Environment.API_DELIVERY;
  String _api = '/api/products';
  BuildContext? context;
  User? sessionUser;
    Future? init(BuildContext context, {User? sessionUser}) {
    this.context = context;
    this.sessionUser = sessionUser;
  }

  Future<List<Product>> getByCategory(String idCategory)async{
    try{  
      Uri url = Uri.http(_url, '$_api/findByCategory/$idCategory');
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
      Product product = Product.fromJsonList(data);
      return product.toList;
    }catch(e){
      print('Error $e');
      return [];
    }
  }

  Future<Stream> create(Product product, List<File> images) async{
  try{
    Uri url = Uri.http(_url, '$_api/create');
  final request = http.MultipartRequest('POST', url);
   request.headers['Authorization'] =sessionUser!.sessionToken.toString();
  for(int i =0; i < images.length; i++){
     request.files.add(http.MultipartFile( 
      'image',
      http.ByteStream(images[i].openRead().cast()),
      await images[i].length(),
      filename: basename(images[i].path)
    ));
  }
  request.fields['product'] = json.encode(product);
  final response = await request.send();
  if(response.statusCode == 401){
    Fluttertoast.showToast(msg: 'La sesion Expiro');
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
}