import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      // 🔐 API / Auth Logic here
      await Future.delayed(const Duration(seconds: 2));

      if (state.email.isEmpty || state.password.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          error: "Email & Password required",
        ));
        return;
      }

      emit(state.copyWith(isLoading: false));
    });
  }
}
