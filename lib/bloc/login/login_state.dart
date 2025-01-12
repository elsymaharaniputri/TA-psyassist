part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

//disimpan data responsenya
class LoginLoaded extends LoginState {
  final LoginResponseModel model;
  LoginLoaded({required this.model});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}
