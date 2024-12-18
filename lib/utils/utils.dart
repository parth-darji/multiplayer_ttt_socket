import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/resources/game_methods.dart';

void showSnackbar(
  BuildContext context, {
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(
  BuildContext context, {
  required String text,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              GameMethods().clearBoard(context);
              Navigator.pop(context);
            },
            child: Text(
              "Play Again",
            ),
          ),
        ],
      );
    },
  );
}
