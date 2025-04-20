class UserModel {
  String? name;
  String? email;
  String? user;
  int? type;
  String? phone;
  String? registrationMethod;
  String? password;
  String? platform;
  String? country;
  String? token;

  UserModel(
      {this.name,
      this.email,
      this.user,
      this.type,
      this.phone,
      this.registrationMethod,
      this.password,
      this.token,
      this.platform,
      this.country});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["type"] = type;
    _data["phone"] = phone;
    _data["registration_method"] = registrationMethod;
    _data["password"] = password;
    _data["platform"] = platform;
    _data["country"] = country;
    return _data;
  }
}
