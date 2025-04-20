import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseDetailsResponse extends CourseModel {
  int? externalCourse;
  String? phone;
  String? video;
  bool? owned;
  bool? allowed;
  bool? haveMeeting;
  String? meetingUrl;
  bool? favorite;

  CourseDetailsResponse(
      {super.id,
      this.externalCourse,
      super.name,
      super.price,
      super.hours,
      super.instructors,
      this.phone,
      super.description,
      super.image,
      this.video,
      this.owned,
      this.allowed,
      this.haveMeeting,
      this.meetingUrl,
      this.favorite});

  CourseDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["external_course"] is int) {
      externalCourse = json["external_course"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["price"] is int) {
      price = double.parse(json["price"]);
    }
    if (json["hours"] is int) {
      hours = json["hours"];
    }
    if (json["instructors"] is List) {
      print('XXXXinstructors${json["instructors"]}');
      instructors = json["instructors"] == null
          ? null
          : List<String>.from(json["instructors"]);
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    print('XXXXXXX${json["description"]}');
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["video"] is String) {
      video = json["video"];
    }
    if (json["meeting_url"] is String) {
      meetingUrl = json["meeting_url"];
    }
    if (json["owned"] is bool) {
      owned = json["owned"];
    }
    if (json["allowed"] is bool) {
      allowed = json["allowed"];
    }
    if (json["have_meeting"] is bool) {
      haveMeeting = json["have_meeting"];
    }
    if (json["favorite"] is bool) {
      favorite = json["favorite"];
    }
  }

  static List<CourseDetailsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CourseDetailsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["external_course"] = externalCourse;
    _data["name"] = name;
    _data["price"] = price;
    _data["hours"] = hours;
    if (instructors != null) {
      _data["instructors"] = instructors;
    }
    _data["phone"] = phone;
    _data["description"] = description;
    _data["image"] = image;
    _data["video"] = video;
    _data["owned"] = owned;
    _data["allowed"] = allowed;
    _data["have_meeting"] = haveMeeting;
    _data["meeting_url"] = meetingUrl;
    _data["favorite"] = favorite;
    return _data;
  }
}
