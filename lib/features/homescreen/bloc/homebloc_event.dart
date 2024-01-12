part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocEvent {}

class AssesmentButtonPressedEvent extends HomeblocEvent{}
class ChatButtonPressedEvent extends HomeblocEvent{}
class StudyMaterialButtonPressedEvent extends HomeblocEvent{}
class CounscellorButtonPressedEvent extends HomeblocEvent{}


