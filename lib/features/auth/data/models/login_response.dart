import 'package:zewail/features/auth/data/models/user_response.dart';

class LoginResponse {
  UserResponse? user;
  String? token;

  LoginResponse({
    this.user,
    this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserResponse.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<LoginResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginResponse.fromJson).toList();
  }
}
