// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';
import 'package:delivery/src/models/address/address.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/users/user.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  String? id;
  String? idClient;
  String? idAddress;
  String? status;
  int? lat;
  int? lng;
  int? timestamp;
  List<Product>? products = [];
  List<Order> toList = [];
  User? client;
  Address? address;
  User? delivery;
  String? idDelivery;
  Order({
    this.id,
    this.idClient,
    this.idAddress,
    this.status,
    this.lat,
    this.lng,
    this.timestamp,
    this.products,
    this.client,
    this.delivery,
    this.address,
    this.idDelivery,
  });
  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] is int ? json["id"].toString() : json['id'],
        idClient: json["id_client"],
        idAddress: json["id_address"],
        status: json["status"],
        lat: json["lat"] is String ? double.parse(json['lat']) : json['lat'],
        lng: json["lng"] is String ? double.parse(json['lng']) : json['lng'],
        timestamp:
            json["timestamp"] is String ? int.parse(json['timestamp']) : json['timestamp'],
        products: json['products'] != null
            ? List<Product>.from(
                json["products"].map((model) =>model is Product ? model : Product.fromJson(model)))
            : [],
            client: json['client'] is String ? userFromJson(json['client']) : (json['client'] is User ? json['client'] : User.fromJson(json['client'] ?? {})),
        delivery: json['delivery'] is String ? userFromJson(json['delivery']) : (json['delivery'] is User ? json['delivery'] : User.fromJson(json['delivery'] ?? {})),
        address: json['address'] is String ? addressFromJson(json['address']) : json['address'] is Address ? json['address'] :  Address.fromJson(json['address'] ?? {}),
        idDelivery: json['id_delivery'],
      );

  static List<Order> fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return [];
    return jsonList.map((item) => Order.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_client": idClient,
        "id_address": idAddress,
        "status": status,
        "lat": lat,
        "lng": lng,
        "timestamp": timestamp,
        "products": products,
        "client": client,
        "delivery": delivery,
        "address": address,
        "id_delivery": idDelivery,
      };
}
