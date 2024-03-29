
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
    String? id;
    String? idUser;
    String? address;
    String? neighborhood;
    double? lat;
    double? lng;
    List<Address> toList = [];
    Address({
         this.id,
         this.idUser,
         this.address,
         this.neighborhood,
         this.lat,
         this.lng,
    });
    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] is int ? json['id'].toString()  : json['id'],
        idUser: json["id_user"],
        address: json["address"],
        neighborhood: json["neighborhood"],
        lat: json["lat"] is String ? double.parse(json['lat']) : json['lat'],
        lng: json["lng"] is String ? double.parse(json['lng']) : json['lng'],
    );
    Address.fromJsonList(List<dynamic>JsonList){
      // ignore: unnecessary_null_comparison
      if (JsonList == null) return;
      // ignore: avoid_function_literals_in_foreach_calls
      JsonList.forEach((item) {
        Address address = Address.fromJson(item);
        toList.add(address);
       });
    }
    Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "address": address,
        "neighborhood": neighborhood,
        "lat": lat,
        "lng": lng,
    };
}
