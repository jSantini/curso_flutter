import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;

  Response(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: Text(text));
  }
}
