import 'package:zewail/features/auth/data/models/user_response.dart';

class UserInfoResponse {
  int? status;
  UserResponse? user;
  String? message;

  UserInfoResponse({this.status, this.user, this.message});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["data"] is Map) {
      user = json["data"] == null ? null : UserResponse.fromJson(json["data"]);
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  static List<UserInfoResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserInfoResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (user != null) {
      _data["data"] = user?.toJson();
    }
    _data["message"] = message;
    return _data;
  }
}
