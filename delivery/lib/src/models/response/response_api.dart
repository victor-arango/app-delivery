import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? message;
  String? error;
  bool? success;
  dynamic data;

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json["error"];
    success = json["success"];
    data = json["data"];

    try {
      data = json["data"];
    } catch (e) {
      // ignore: avoid_print
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
        'success': success,
        'data': data,
      };

  // Map<String, dynamic> toJson() =>
  //     {"message": message!, "error": error!, "success": success!, "data": data};
}
