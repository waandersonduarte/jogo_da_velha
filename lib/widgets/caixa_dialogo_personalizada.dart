import 'package:flutter/material.dart';
import '../testemunho/constantes.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onPressed;

  const CustomDialog({
    required this.title,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
          child: Text(RESET_BUTTON_LABEL),
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
        ),
      ],
    );
  }
}
