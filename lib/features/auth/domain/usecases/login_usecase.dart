import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';
import 'package:zewail/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class LoginUsecase extends BaseUseCase<Either<Failure, UserModel>, UserModel> {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);
  @override
  Future<Either<Failure, UserModel>> call(UserModel params) {
    return _authRepository.login(params.email!, params.password!);
  }
}
