
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    String? id;
    String? name;
    String? description;
    List<Category> toList = [];

    Category({
        this.id,
        this.name,
         this.description,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] is int ? json['id'].toString() : json['id'],
        name: json["name"],
        description: json["description"],
    );


    Category.fromJsonList(List<dynamic>JsonList){
      // ignore: unnecessary_null_comparison
      if (JsonList == null) return;
      // ignore: avoid_function_literals_in_foreach_calls
      JsonList.forEach((item) {
        Category category = Category.fromJson(item);
        toList.add(category);
       });
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
