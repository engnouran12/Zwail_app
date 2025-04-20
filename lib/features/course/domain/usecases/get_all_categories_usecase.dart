import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/domain/repositories/course_repository.dart';

@injectable
class GetAllCategoriesUsecase
    implements BaseUseCaseNoParams<Either<Failure, List<CategoryModel>>> {
  final CourseRepository _repository;

  const GetAllCategoriesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call() async {
    return _repository.getAllCategories();
  }
}
