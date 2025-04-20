import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseResponse extends CourseModel {
  CourseResponse(
      {super.id,
      super.name,
      super.image,
      super.description,
      super.language,
      super.hours,
      super.minutes,
      super.weeks,
      super.type,
      super.price,
      super.instructors});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["hours"] is int) {
      hours = json["hours"];
    }
    if (json["minutes"] is int) {
      minutes = json["minutes"];
    }
    if (json["weeks"] is int) {
      weeks = json["weeks"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["price"] is String) {
      price = json["price"];
    }
    if (json["instructors"] is List) {
      instructors = json["instructors"] ?? [];
    }
  }

  static List<CourseResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CourseResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    _data["language"] = language;
    _data["hours"] = hours;
    _data["minutes"] = minutes;
    _data["weeks"] = weeks;
    _data["type"] = type;
    _data["price"] = price;
    if (instructors != null) {
      _data["instructors"] = instructors;
    }
    return _data;
  }
}
