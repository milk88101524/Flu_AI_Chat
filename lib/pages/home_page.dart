import 'package:flu_ai_chat/bloc/chat_bloc/chat_bloc.dart';
import 'package:flu_ai_chat/bloc/chat_bloc/chat_event.dart';
import 'package:flu_ai_chat/bloc/chat_bloc/chat_state.dart';
import 'package:flu_ai_chat/components/bot_chat_card.dart';
import 'package:flu_ai_chat/components/my_chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (context) => ChatBloc(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final FocusNode focusNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    print(state.toString());
                    if (state is ChatLoadSuccess) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          if (state.messages[index].role == "user") {
                            return MyChatCard(
                              message: state.messages[index].content,
                            );
                          } else {
                            return BotChatCard(
                              message: state.messages[index].content,
                            );
                          }
                        },
                        itemCount: state.messages.length,
                      );
                    } else if (state is ChatError) {
                      return Center(child: Text(state.error));
                    }
                    return SizedBox.shrink();
                  },
                ),
                // child:
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Send a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      controller: controller,
                      focusNode: focusNode,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        BlocProvider.of<ChatBloc>(
                          context,
                        ).add(SendMessage(controller.text));
                        controller.text = "";
                      } else {
                        print("text is empty");
                      }
                    },
                    child: Text("Send"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
