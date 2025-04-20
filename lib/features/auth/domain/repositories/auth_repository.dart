import 'package:dartz/dartz.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, UserModel>> signup(UserModel user);
  Future<Either> forgotPassword(String email);
  Future<Either<Failure, void>> verifyEmail(String code);
}
