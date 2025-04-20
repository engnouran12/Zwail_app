import 'package:dartz/dartz.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, CategoryModel>> getCategoryDetails(String id);
  Future<Either<Failure, CourseModel>> getCourseDetails(String id);
  Future<Either<Failure, List<CourseModel>>> getCoursesFiltered(
      CoursesParametersModel parameters);
}
