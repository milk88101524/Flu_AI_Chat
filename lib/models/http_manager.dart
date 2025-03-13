import "dart:convert";

import "package:flu_ai_chat/models/ollama_chat_request.dart";
import "package:http/http.dart" as http;

class HttpManager {
  String urlString = "http://localhost:11434/api/chat";
  String model = "llama3.1:8b";

  Future<OllamaChatMessage> getResponse(OllamaChatMessage userMessage) async {
    var message = OllamaChatRequest(model, <OllamaChatMessage>[
      userMessage,
    ], false);

    var response = await http.post(
      Uri.parse(urlString),
      body: jsonEncode(message.toJson()),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      OllamaChatMessage chatMessage = OllamaChatResponse.fromJson(data).message;
      print("$chatMessage");
      return chatMessage;
    } else {
      throw Exception("Fail ${response.statusCode} ${response.body}");
    }
  }
}
