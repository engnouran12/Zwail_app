import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class VerifyEmailUsecase extends BaseUseCase<Either<Failure, void>, String> {
  final AuthRepository _authRepository;

  VerifyEmailUsecase(this._authRepository);
  @override
  Future<Either<Failure, void>> call(String params) {
    return _authRepository.verifyEmail(params);
  }
}
