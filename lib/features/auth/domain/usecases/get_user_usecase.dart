import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';
import 'package:zewail/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class GetUserUsecase extends BaseUseCaseNoParams<Either<Failure, UserModel>> {
  final AuthRepository _authRepository;

  GetUserUsecase(this._authRepository);
  @override
  Future<Either<Failure, UserModel>> call() {
    return _authRepository.getUser();
  }
}
