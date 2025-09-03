import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;

  Result(this.points);

  String get textResult {
    if (points < 8) {
      return 'Parabéns!';
    } else if (points < 12) {
      return 'Você é bom';
    } else if (points < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(textResult, style: TextStyle(fontSize: 28)));
  }
}
