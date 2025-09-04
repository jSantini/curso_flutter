import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() restartQuestionForm;

  Result(this.points, this.restartQuestionForm);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(textResult, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: restartQuestionForm,
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
