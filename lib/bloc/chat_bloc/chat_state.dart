import 'package:flu_ai_chat/models/ollama_chat_request.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoadSuccess extends ChatState {
  final List<OllamaChatMessage> messages;

  ChatLoadSuccess(this.messages);
}

class ChatError extends ChatState {
  final String error;

  ChatError(this.error);
}
