part of 'authentication_bloc_bloc.dart';

@immutable
sealed class AuthenticationBlocEvent {}

class LoginButtonPressedEvent extends AuthenticationBlocEvent{}

class ForgotPasswordButtonPressedEvent extends AuthenticationBlocEvent{}

class DontHaveAccountButtonPressedEvent extends AuthenticationBlocEvent{}

class SendLinkButtonPressedEvent extends AuthenticationBlocEvent{}

class SignUpButtonPressedEvent extends AuthenticationBlocEvent{}

class AlreadyHaveAnAccountButtonPressedEvent extends AuthenticationBlocEvent{}