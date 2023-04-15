// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

class ResponseApi {
  String? message;
  String? error;
  bool? success;

  ResponseApi({
    this.message,
    this.error,
    this.success,
  });

  factory ResponseApi.fromRawJson(String str) =>
      ResponseApi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        message: json["message"],
        error: json["error"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
      };
}
