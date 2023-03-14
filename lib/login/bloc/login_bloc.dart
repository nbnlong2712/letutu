import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitialState) {}
    });
  }

  Future<void> _mapLoginStartEvent(Emitter<LoginState> emitter) async {
    emitter(LoginCheckingState());
  }
}
