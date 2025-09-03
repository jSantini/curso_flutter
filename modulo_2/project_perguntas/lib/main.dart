import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: Column(
          children: [
            Question(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 3'),
            ),

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
