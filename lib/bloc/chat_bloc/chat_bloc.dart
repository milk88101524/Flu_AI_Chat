import 'package:flu_ai_chat/bloc/chat_bloc/chat_event.dart';
import 'package:flu_ai_chat/bloc/chat_bloc/chat_state.dart';
import 'package:flu_ai_chat/models/http_manager.dart';
import 'package:flu_ai_chat/models/ollama_chat_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final HttpManager manager = HttpManager();
  String role = "user";
  List<OllamaChatMessage> messages = [];

  ChatBloc() : super(ChatInitial()) {
    on<SendMessage>(_sendMessage);
  }

  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit) async {
    var userMessage = OllamaChatMessage(role, event.message);
    messages.add(userMessage);

    emit(ChatLoadSuccess(messages));
    try {
      messages.add(await manager.getResponse(userMessage));
      emit(ChatLoadSuccess(messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
