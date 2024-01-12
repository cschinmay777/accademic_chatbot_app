part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocState {}

abstract class AuthenticationBlocActionState extends AuthenticationBlocState{}

final class AuthenticationBlocInitial extends AuthenticationBlocActionState {}

final class NavigateToHomeScreenState extends AuthenticationBlocActionState{}

final class NavigateToForgotPasswordScreenState extends AuthenticationBlocActionState{}

final class NavigateToSignUpScreenScreenState extends AuthenticationBlocActionState{}

final class NavigateToLoginScreenState extends AuthenticationBlocActionState{}