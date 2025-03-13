import 'package:flutter/material.dart';

class BotChatCard extends StatelessWidget {
  final String message;
  const BotChatCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(message),
              ),
            ),
          ),
          SizedBox(width: 5),
          Text("12:34"),
        ],
      ),
    );
  }
}
