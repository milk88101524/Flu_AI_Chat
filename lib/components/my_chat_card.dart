import 'package:flutter/material.dart';

class MyChatCard extends StatelessWidget {
  final String message;
  const MyChatCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("12:34"),
          SizedBox(width: 5),
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(message),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
