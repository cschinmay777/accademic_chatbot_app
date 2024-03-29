import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<ChatButtonPressedEvent>(chatButtonPressedEvent);
  }

  FutureOr<void> chatButtonPressedEvent(ChatButtonPressedEvent event, Emitter<HomeblocState> emit) {
    print("Navigated to Chat Screen");
    emit(NavigateToChatPageScreenState());
  }
}
