part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class EditAgreeTerms extends AuthState {
  EditAgreeTerms();
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final Failure message;

  SignUpFailure({required this.message});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final Failure message;

  LoginFailure({required this.message});
}

class GetUserLoading extends AuthState {}

class VerifyEmailSuccess extends AuthState {
  final String code;

  VerifyEmailSuccess({required this.code});
}

class GetUserSuccess extends AuthState {}

class GetUserFailure extends AuthState {
  final Failure message;

  GetUserFailure({required this.message});
}
