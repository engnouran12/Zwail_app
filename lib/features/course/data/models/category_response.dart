import 'package:zewail/features/course/data/models/course_response.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';

class CategoryResponse extends CategoryModel {
  CategoryResponse(
      {super.id, super.name, super.image, super.description, super.courses});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
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
    if (json["courses"] is List) {
      courses = (json["courses"] as List)
          .map(
            (e) => CourseResponse.fromJson(e),
          )
          .toList();
    }
  }

  static List<CategoryResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    if (courses != null) {
      _data["courses"] = courses;
    }
    return _data;
  }
}
