import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/core/helpers/dialog_helper.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';
import 'package:zewail/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:zewail/features/auth/domain/usecases/login_usecase.dart';
import 'package:zewail/features/auth/domain/usecases/register_usecase.dart';
import 'package:zewail/features/auth/domain/usecases/verify_email_usecase.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  UserModel? currentUser;
  AuthCubit() : super(AuthInitial());
  getUser() async {
    emit(GetUserLoading());

    GetUserUsecase signUpUsecase = getIt<GetUserUsecase>();
    var response = await signUpUsecase();
    response.fold((l) {
      if (l is TimeoutFailure || l is ConnectionFailure) {
        DialogHelper.showErrorDialog(message: l.message);
      }
      emit(GetUserFailure(message: l));
    }, (r) {
      currentUser = r;
      emit(GetUserSuccess());
    });
  }

  login(UserModel user) async {
    emit(SignUpLoading());
    DialogHelper.showLoadingDialog();
    LoginUsecase signUpUsecase = getIt<LoginUsecase>();
    var response = await signUpUsecase(user);
    response.fold((l) {
      DialogHelper.showErrorDialog(message: l.message);
      emit(LoginFailure(message: l));
    }, (r) {
      currentUser = r;
      emit(LoginSuccess());
    });
  }

  signUp(UserModel user) async {
    emit(SignUpLoading());
    DialogHelper.showLoadingDialog();
    SignUpUsecase signUpUsecase = getIt<SignUpUsecase>();
    var response = await signUpUsecase(user);
    response.fold((l) {
      DialogHelper.showErrorDialog(message: l.message);
      emit(SignUpFailure(message: l));
    }, (r) {
      currentUser = r;
      verifyEmail();
      emit(SignUpSuccess());
    });
  }

  verifyEmail({String code = '0000'}) async {
    DialogHelper.showLoadingDialog();
    VerifyEmailUsecase signUpUsecase = getIt<VerifyEmailUsecase>();
    var response = await signUpUsecase(code);
    response.fold((l) {
      DialogHelper.showErrorDialog(message: l.message);
      emit(SignUpFailure(message: l));
    }, (r) {
      emit(VerifyEmailSuccess(code: code));
    });
  }

  reSendCode() {}
  confirmOtp() {}
  resetPassword() {}
}
