import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/core/common/data/models/api_response.dart';
import 'package:zewail/core/network/endpoints.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/auth/data/models/login_response.dart';
import 'package:zewail/features/auth/data/models/user_response.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<UserResponse> signup(UserModel user);
  Future<UserResponse> getUser();
  Future<void> verifyEmail(String code);
  Future<void> forgotPasswordRequest(String email);
  Future<void> confirmOtp(
    String otp,
    String email,
  );
  Future<void> forgotPasswordResetPassword(String password, String email);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<UserResponse> getUser() async {
    final response = await dio.get(Endpoints.userInfo);
    var userInfoResponse = ApiResponse.fromJson(
      response.data,
      (json) => UserResponse.fromJson(json),
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        userInfoResponse.data != null) {
      return userInfoResponse.data!;
    } else {
      throw Failure(response.statusCode, userInfoResponse.message);
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await dio
        .post(Endpoints.login, data: {"login": email, "password": password});
    var loginResponse = ApiResponse.fromJson(
      response.data,
      (json) => LoginResponse.fromJson(json),
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        loginResponse.data != null) {
      return loginResponse.data!;
    } else {
      print('XX${loginResponse.message}');
      throw Failure(response.statusCode, loginResponse.message);
    }
  }

  @override
  Future<UserResponse> signup(UserModel user) async {
    print('XX->${user.name}');
    String platform = Platform.isAndroid ? "Android" : "Ios";
    user.platform = platform;
    user.registrationMethod = platform;
    final response = await dio.post(Endpoints.register, data: user.toJson());
    var registerResponse = ApiResponse.fromJson(
      response.data,
      (json) => UserResponse.fromJson(json),
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        registerResponse.data != null) {
      return registerResponse.data!;
    } else {
      print('XX${registerResponse.message}');
      throw Failure(response.statusCode, registerResponse.message);
    }
  }

  @override
  Future<void> confirmOtp(String otp, String email) {
    // TODO: implement confirmOtp
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPasswordRequest(String email) {
    // TODO: implement forgotPasswordRequest
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPasswordResetPassword(String password, String email) {
    // TODO: implement forgotPasswordResetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> verifyEmail(String code) async {
    final response = await dio.post(
      Endpoints.verifyEmail,
      queryParameters: {"code": code},
    );
    var res = ApiResponse.fromJson(
      response.data,
      (json) => null,
    );
    if ((response.statusCode == 200 || response.statusCode == 201)) {
      return;
    } else {
      print('registerResendCodeXX${res.message}');
      throw Failure(response.statusCode, res.message);
    }
  }
}
