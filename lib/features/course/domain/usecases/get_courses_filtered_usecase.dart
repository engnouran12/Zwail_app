import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';
import 'package:zewail/features/course/domain/repositories/course_repository.dart';

@injectable
class GetCoursesFilteredUsecase
    implements
        BaseUseCase<Either<Failure, List<CourseModel>>,
            CoursesParametersModel> {
  final CourseRepository _repository;

  const GetCoursesFilteredUsecase(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(
      CoursesParametersModel parameters) async {
    return _repository.getCoursesFiltered(parameters);
  }
}
