import 'package:zewail/features/auth/domain/entities/user_model.dart';

class UserResponse extends UserModel {
  int? id;

  String? emailVerifiedAt;

  dynamic code;
  dynamic image;
  int? active;
  dynamic macAddress;
  dynamic deviceToken;
  int? isVerified;
  dynamic lastSeen;
  dynamic lastIp;
  int? visitCount;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? courses;

  UserResponse(
      {this.id,
      super.name,
      super.token,
      super.email,
      super.user,
      this.emailVerifiedAt,
      super.phone,
      this.code,
      this.image,
      this.active,
      this.macAddress,
      this.deviceToken,
      super.registrationMethod,
      this.isVerified,
      super.platform,
      this.lastSeen,
      this.lastIp,
      this.visitCount,
      this.createdAt,
      this.updatedAt,
      this.courses});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["name"] is String) {
      user = json["name"];
    }
    if (json["email_verified_at"] is String) {
      emailVerifiedAt = json["email_verified_at"];
    }
    phone = json["phone"];
    code = json["code"];
    image = json["image"];
    if (json["active"] is int) {
      active = json["active"];
    }
    macAddress = json["mac_address"];
    deviceToken = json["device_token"];
    if (json["registration_method"] is String) {
      registrationMethod = json["registration_method"];
    }
    if (json["is_verified"] is int) {
      isVerified = json["is_verified"];
    }
    if (json["platform"] is String) {
      platform = json["platform"];
    }
    lastSeen = json["last_seen"];
    lastIp = json["last_ip"];
    if (json["visit_count"] is int) {
      visitCount = json["visit_count"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["courses"] is List) {
      courses = json["courses"] ?? [];
    }
  }

  static List<UserResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponse.fromJson).toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["name"] = user;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["phone"] = phone;
    _data["code"] = code;
    _data["image"] = image;
    _data["active"] = active;
    _data["mac_address"] = macAddress;
    _data["device_token"] = deviceToken;
    _data["registration_method"] = registrationMethod;
    _data["is_verified"] = isVerified;
    _data["platform"] = platform;
    _data["last_seen"] = lastSeen;
    _data["last_ip"] = lastIp;
    _data["visit_count"] = visitCount;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (courses != null) {
      _data["courses"] = courses;
    }
    return _data;
  }
}
