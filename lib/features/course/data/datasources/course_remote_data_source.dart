import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/common/data/models/api_response.dart';
import 'package:zewail/core/network/endpoints.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/data/models/category_response.dart';
import 'package:zewail/features/course/data/models/course_response.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';

abstract class CourseRemoteDataSource {
  Future<List<CategoryResponse>> getAllCategories();
  Future<CategoryResponse> getCategoryDetails(String id);
  Future<CourseResponse> getCourseDetails(String id);
  Future<List<CourseResponse>> getCoursesFiltered(
      CoursesParametersModel parameters);
}

@Injectable(as: CourseRemoteDataSource)
class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final Dio _dio;

  CourseRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CategoryResponse>> getAllCategories() async {
    final response = await _dio.get(Endpoints.categoriesList);
    var categoriesResponse = ApiResponse<List<CategoryResponse>?>.fromJson(
      response.data,
      (json) => (json is List)
          ? json
              .map(
                (e) => CategoryResponse.fromJson(e),
              )
              .toList()
          : null,
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        categoriesResponse.data != null) {
      return categoriesResponse.data!;
    } else {
      throw Failure(response.statusCode, categoriesResponse.message);
    }
  }

  @override
  Future<CategoryResponse> getCategoryDetails(String id) async {
    final response = await _dio.get(Endpoints.categoryDetails + id);
    var categoryDetailsResponse = ApiResponse.fromJson(
      response.data,
      (json) => CategoryResponse.fromJson(json),
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        categoryDetailsResponse.data != null) {
      return categoryDetailsResponse.data!;
    } else {
      throw Failure(response.statusCode, categoryDetailsResponse.message);
    }
  }

  @override
  Future<List<CourseResponse>> getCoursesFiltered(
      CoursesParametersModel parameters) async {
    final response = await _dio.get(Endpoints.coursesDetails,
        queryParameters: parameters.toJson());
    var coursesResponse = ApiResponse<List<CourseResponse>?>.fromJson(
      response.data,
      (json) => (json is List)
          ? json
              .map(
                (e) => CourseResponse.fromJson(e),
              )
              .toList()
          : null,
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        coursesResponse.data != null) {
      return coursesResponse.data!;
    } else {
      throw Failure(response.statusCode, coursesResponse.message);
    }
  }

  @override
  Future<CourseResponse> getCourseDetails(String id) async {
    final response = await _dio.get(Endpoints.coursesDetails + id);
    var courseDetailsResponse = ApiResponse.fromJson(
      response.data,
      (json) => CourseResponse.fromJson(json),
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        courseDetailsResponse.data != null) {
      return courseDetailsResponse.data!;
    } else {
      throw Failure(response.statusCode, courseDetailsResponse.message);
    }
  }
}
