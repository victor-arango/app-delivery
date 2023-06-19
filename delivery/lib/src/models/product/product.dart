// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String? id;
    String? name;
    String? description;
    String? image1;
    String? image2;
    String? image3;
    double? price;
    int? idCategory;
    int? quantify;
    List<Product> toList = [];

    Product({
        this.id,
        this.name,
        this.description,
        this.image1,
        this.image2,
        this.image3,
        this.price,
        this.idCategory,
        this.quantify,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] is int ? json['id'].toString() : json['id'],
        name: json["name"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        price: json["price"] is String ? double.parse(json["price"]) : isInteger(json["price"]) ? json["price"]?.toDouble() : json['price'] ,
        idCategory: json["id_category"] is String ? int.parse(json["id_category"]) : json["id_category"],
        quantify: json["quantify"],
    );

    
    Product.fromJsonList(List<dynamic>JsonList){
      // ignore: unnecessary_null_comparison
      if (JsonList == null) return;
      // ignore: avoid_function_literals_in_foreach_calls
      JsonList.forEach((item) {
        Product category = Product.fromJson(item);
        toList.add(category);
       });
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "price": price,
        "id_category": idCategory,
        "quantify": quantify,
    };
}


 bool isInteger(num value) => value is int || value == value.roundToDouble();