import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  Response(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        ),
        child: Text(text),
      ),
    );
  }
}
