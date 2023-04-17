// ignore_for_file: prefer_final_fields, body_might_complete_normally_nullable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/environment.dart';
import '../models/response/response_api.dart';
import '../models/users/user.dart';

class UsersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
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
