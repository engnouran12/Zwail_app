import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/repositories/course_repository.dart';

@injectable
class GetCourseDetailsUsecase
    implements BaseUseCase<Either<Failure, CourseModel>, String> {
  final CourseRepository _repository;

  const GetCourseDetailsUsecase(this._repository);

  @override
  Future<Either<Failure, CourseModel>> call(String id) async {
    return _repository.getCourseDetails(id);
  }
}
