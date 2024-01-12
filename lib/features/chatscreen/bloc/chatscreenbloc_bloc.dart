import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatscreenbloc_event.dart';
part 'chatscreenbloc_state.dart';

class ChatscreenblocBloc extends Bloc<ChatscreenblocEvent, ChatscreenblocState> {
  ChatscreenblocBloc() : super(ChatscreenblocInitial()) {
    on<ChatscreenblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
