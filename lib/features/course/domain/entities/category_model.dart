import 'package:zewail/features/course/domain/entities/course_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? description;
  List<CourseModel>? courses;

  CategoryModel(
      {this.id, this.name, this.image, this.description, this.courses});
}
