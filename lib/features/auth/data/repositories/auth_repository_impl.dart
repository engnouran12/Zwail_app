import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/common/domain/repository/preferences_repository.dart';
import 'package:zewail/core/config/constants.dart';
import 'package:zewail/core/network/error/error_handler.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:zewail/features/auth/data/models/user_response.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';
import 'package:zewail/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final PreferencesRepository preferencesRepository;

  AuthRepositoryImpl(this.preferencesRepository,
      {required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      var response = await authRemoteDataSource.getUser();

      return right(response);
    } catch (e) {
      print('getUser####==>${e.toString()}');
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      var response = await authRemoteDataSource.login(email, password);
      if (response.token != null) {
        preferencesRepository.insertValueByKey(
            AppConstants.tokenKey, response.token);
      }
      return right(response.user!);
    } catch (e) {
      print('login####==>${e.toString()}');
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signup(UserModel user) async {
    try {
      UserResponse response = await authRemoteDataSource.signup(user);
      if (response.token != null) {
        preferencesRepository.insertValueByKey(
            AppConstants.tokenKey, response.token);
      }
      return right(response);
    } catch (e) {
      print('signup####==>${e.toString()}');
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either> forgotPassword(String email) async {
    try {
      return right('response');
    } catch (e) {
      print('getUser####==>${e.toString()}');
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail(String code) async {
    try {
      await authRemoteDataSource.verifyEmail(code);

      return right(null);
    } catch (e) {
      print('verifyEmail####==>${e.toString()}');
      return left(ErrorHandler.handleError(e));
    }
  }
}
