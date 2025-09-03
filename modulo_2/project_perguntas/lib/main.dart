import 'package:flutter/material.dart';
import './question.dart';
import './response.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'text': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'text': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Léo', 'Pedro'],
      },
    ];

    List<Widget> answers = [];

    for (var textResp in perguntas[_perguntaSelecionada]['respostas'] as List) {
      answers.add(Response(textResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: Column(
          children: [
            Question(perguntas[_perguntaSelecionada]['text'].toString()),
            ...answers,
            // ElevatedButton(
            //   onPressed: _responder,
            //   child: const Text('Resposta 2'),
            // ),
            // ElevatedButton(
            //   onPressed: _responder,
            //   child: const Text('Resposta 3'),
            // ),

            // ElevatedButton(
            //   onPressed: responder, // PASSANDO UMA FUNÇAO NOMEADA DA CLASSE
            //   child: const Text('Resposta 1'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     print(
            //       'Resposta 2 foi selecionada!',
            //     ); // CRIANDO E PASSANDO UMA FUNÇAO LOCAL
            //   },
            //   child: const Text('Resposta 2'),
            // ),
            // ElevatedButton(
            //   onPressed: () => print(
            //     'Resposta 3!!!',
            //   ), // OUTRA FORMA DE CRIAR E PASSAR UMA FUNÇAO LOCAL
            //   child: const Text('Resposta 3'),
            // ),
          ],
        ),
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
