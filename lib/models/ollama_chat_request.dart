class OllamaChatRequest {
  String model;
  List<OllamaChatMessage> messages;
  bool stream;

  OllamaChatRequest(this.model, this.messages, this.stream);

  Map<String, dynamic> toJson() {
    return {
      "model": model,
      "messages": messages.map((msg) => msg.toJson()).toList(),
      "stream": stream,
    };
  }
}

class OllamaChatMessage {
  String role;
  String content;

  OllamaChatMessage(this.role, this.content);

  factory OllamaChatMessage.fromJson(Map<String, dynamic> json) {
    return OllamaChatMessage(json['role'] ?? '', json['content'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {"role": role, "content": content};
  }
}

class OllamaChatResponse {
  OllamaChatMessage message;

  OllamaChatResponse(this.message);

  // 從 JSON 解析
  factory OllamaChatResponse.fromJson(Map<String, dynamic> json) {
    return OllamaChatResponse(OllamaChatMessage.fromJson(json['message']));
  }

  Map<String, dynamic> toJson() {
    return {"message": message};
  }
}
