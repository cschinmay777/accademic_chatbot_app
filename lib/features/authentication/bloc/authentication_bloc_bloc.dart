import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBlocBloc extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBlocBloc() : super(AuthenticationBlocInitial()) {
    on<DontHaveAccountButtonPressedEvent>(dontHaveAccountButtonPressedEvent);

    on<ForgotPasswordButtonPressedEvent>(forgotPasswordButtonPressedEvent);

    on<AlreadyHaveAnAccountButtonPressedEvent>(alreadyHaveAnAccountButtonPressedEvent);

    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
  }



  FutureOr<void> dontHaveAccountButtonPressedEvent(DontHaveAccountButtonPressedEvent event, Emitter<AuthenticationBlocState> emit) {
  print("Dont Have an Account button pressed");
  emit(NavigateToSignUpScreenScreenState());
  }

  FutureOr<void> forgotPasswordButtonPressedEvent(ForgotPasswordButtonPressedEvent event, Emitter<AuthenticationBlocState> emit) {
    print("Forgot Password button pressed");
  emit(NavigateToForgotPasswordScreenState());
  }

  FutureOr<void> alreadyHaveAnAccountButtonPressedEvent(AlreadyHaveAnAccountButtonPressedEvent event, Emitter<AuthenticationBlocState> emit) {
  }

  FutureOr<void> loginButtonPressedEvent(LoginButtonPressedEvent event, Emitter<AuthenticationBlocState> emit) {
    print("Login button pressed");
  emit(NavigateToHomeScreenState());
  }
}
