// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print
import 'dart:convert';
import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class OrdersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/orders';
  BuildContext? context;
  User? sessionUser;
  Future<void> init(BuildContext context, {User? sessionUser}) async {
    this.context = context;
    this.sessionUser = sessionUser;
  }
  Future<List<Order>> getBystatus(String status) async {
    try {
      Uri url = Uri.http(_url, '$_api/findBystatus/$status');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.get(url, headers: headers);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
        SharedPref().logout(context!, sessionUser!.id.toString());
        return [];
      }
      final data = jsonDecode(res.body);
      List<Order> orders = Order.fromJsonList(data);
      return orders;
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
  Future<List<Order>> getByDeliveryAndstatus(String idDelivery, String status) async {
    try {
      Uri url = Uri.http(_url, '$_api/findByDeliveryAndstatus/$idDelivery/$status');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.get(url, headers: headers);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
        SharedPref().logout(context!, sessionUser!.id.toString());
        return [];
      }
      final data = jsonDecode(res.body);
      List<Order> orders = Order.fromJsonList(data);
      return orders;
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
  Future<List<Order>> getByClientAndstatus(String idClient, String status) async {
    try {
      Uri url = Uri.http(_url, '$_api/findByClientAndStatus/$idClient/$status');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.get(url, headers: headers);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
        SharedPref().logout(context!, sessionUser!.id.toString());
        return [];
      }
      final data = jsonDecode(res.body);
      List<Order> orders = Order.fromJsonList(data);
      return orders; 
    } catch (e) {
      print('Error $e');
      return [];
    }
  }

  Future<ResponseApi?> create(Order order) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(order);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
        SharedPref().logout(context!, sessionUser!.id.toString());
        return null;
      }
      final data = jsonDecode(res.body);
      print(data);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ResponseApi?> updatetoDispatched(Order order) async {
    try {
      Uri url = Uri.http(_url, '$_api/updateToDispatched');
      String bodyParams = json.encode(order);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.put(url, headers: headers, body: bodyParams);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
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
  Future<ResponseApi?> updateToOnTheWay(Order order) async {
    try {
      Uri url = Uri.http(_url, '$_api/updateToOnTheWay');
      String bodyParams = json.encode(order);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.put(url, headers: headers, body: bodyParams);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
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
  Future<ResponseApi?> updateTodelivery(Order order) async {
    try {
      Uri url = Uri.http(_url, '$_api/updateTodelivery');
      String bodyParams = json.encode(order);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': sessionUser!.sessionToken.toString()
      };
      final res = await http.put(url, headers: headers, body: bodyParams);
      if (res.statusCode == 401) {
        //No autorizado
        Fluttertoast.showToast(msg: 'La sesión ha expirado');
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

