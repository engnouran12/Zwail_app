import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/domain/repositories/course_repository.dart';

@injectable
class GetCategoryDetailsUsecase
    implements BaseUseCase<Either<Failure, CategoryModel>, String> {
  final CourseRepository _repository;

  const GetCategoryDetailsUsecase(this._repository);

  @override
  Future<Either<Failure, CategoryModel>> call(String id) async {
    return _repository.getCategoryDetails(id);
  }
}
