import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/base/usecase/base_usecase.dart';
import 'package:zewail/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class ForgotPasswordUsecase extends BaseUseCase<void, String> {
  final AuthRepository _authRepository;

  ForgotPasswordUsecase(this._authRepository);
  @override
  Future<Either> call(String params) {
    return _authRepository.forgotPassword(params);
  }
}
