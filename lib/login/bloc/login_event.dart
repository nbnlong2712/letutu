part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginStartEvent extends LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent {}
