import 'package:flutter/material.dart';
import './question_form.dart';
import './result.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _totalPoints = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'respostas': [
        {'text': 'Preto', 'points': 10},
        {'text': 'Vermelho', 'points': 5},
        {'text': 'Verde', 'points': 3},
        {'text': 'Branco', 'points': 1},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'respostas': [
        {'text': 'Coelho', 'points': 10},
        {'text': 'Cobra', 'points': 5},
        {'text': 'Elefante', 'points': 3},
        {'text': 'Leão', 'points': 1},
      ],
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'text': 'Maria', 'points': 10},
        {'text': 'João', 'points': 5},
        {'text': 'Léo', 'points': 3},
        {'text': 'Pedro', 'points': 1},
      ],
    },
  ];

  void _responder(int points) {
    if (hasQuestionSelected) {
      setState(() {
        _perguntaSelecionada++;
        _totalPoints += points;
      });
    }
  }

  bool get hasQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: hasQuestionSelected
            ? QuestionForm(
                questions: _perguntas,
                questionSelected: _perguntaSelecionada,
                toAnswer: _responder,
              )
            : Result(_totalPoints),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
