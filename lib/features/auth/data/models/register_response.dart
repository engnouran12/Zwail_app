import 'package:zewail/features/auth/data/models/user_response.dart';

class RegisterResponse {
  int? status;
  String? message;
  UserResponse? user;

  RegisterResponse({this.status, this.message, this.user});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserResponse.fromJson(json["user"]);
    }
  }

  static List<RegisterResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterResponse.fromJson).toList();
  }
}
