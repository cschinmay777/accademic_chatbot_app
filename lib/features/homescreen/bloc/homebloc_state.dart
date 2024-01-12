part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeblocActionState extends HomeblocState{}

final class HomeblocInitial extends HomeblocState {}

final class NavigateToAssesmentPageScreenState extends HomeblocActionState{}

final class NavigateToChatPageScreenState extends HomeblocActionState{}

final class NavigateToStudyMaterialPageScreenState extends HomeblocActionState{}

final class NavigateToCounscellorPageScreenState extends HomeblocActionState{}


