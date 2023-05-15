// ignore_for_file: file_names

import 'dart:convert';

import '../rol/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? sessionToken;
  String? image;
  List<Rol>? roles = [];
  List<User> toList = [];

  User(
      {this.id,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.password,
      this.sessionToken,
      this.image,
      this.roles});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json['id'].toString() : json['id'],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        sessionToken: json["session_token"],
        image: json["image"],
        roles: json["roles"] == null
            ? []
            : (json['roles'] as List)
                .map((model) => Rol.fromJson(model))
                .toList(),
      );

           User.fromJsonList(List<dynamic>JsonList){
      // ignore: unnecessary_null_comparison
      if (JsonList == null) return;
      // ignore: avoid_function_literals_in_foreach_calls
      JsonList.forEach((item) {
        User user = User.fromJson(item);
        toList.add(user);
       });
    }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "session_token": sessionToken,
        "image": image,
        "roles": roles,
      };

  map(Function(dynamic client) param0) {}
}
