import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/network/error/error_handler.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/data/datasources/course_remote_data_source.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';
import 'package:zewail/features/course/domain/repositories/course_repository.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource _courseRemoteDataSource;

  CourseRepositoryImpl({required CourseRemoteDataSource courseRemoteDataSource})
      : _courseRemoteDataSource = courseRemoteDataSource;
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      var response = await _courseRemoteDataSource.getAllCategories();
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> getCategoryDetails(String id) async {
    try {
      var response = await _courseRemoteDataSource.getCategoryDetails(id);
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCoursesFiltered(
      CoursesParametersModel parameters) async {
    try {
      var response =
          await _courseRemoteDataSource.getCoursesFiltered(parameters);
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, CourseModel>> getCourseDetails(String id) async {
    try {
      var response = await _courseRemoteDataSource.getCourseDetails(id);
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
