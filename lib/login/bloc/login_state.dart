part of 'login_bloc.dart';

enum Login { Logged, NotLogged }

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginCheckByTokenState extends LoginState {
  final String? token;

  LoginCheckByTokenState({this.token});
}

class LoginCheckCredentialState extends LoginState {
  final String? email;
  final String? password;

  LoginCheckCredentialState({this.email, this.password});
}

class LoginCheckFinishedState extends LoginState {
  final bool? isCheckPass;
  final String? error;

  LoginCheckFinishedState({this.isCheckPass, this.error});
}
