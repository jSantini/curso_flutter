import 'package:flutter/material.dart';
import './question.dart';
import './response.dart';

class QuestionForm extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function() toAnswer;

  const QuestionForm({
    required this.questions,
    required this.questionSelected,
    required this.toAnswer,
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasQuestionSelected
        ? questions[questionSelected]['respostas'] as List<Map<String, Object>>
        : [];

    List<Widget> widgets = answers
        .map((t) => Response(t['text'] as String, toAnswer))
        .toList();

    return Column(
      children: [
        Question(questions[questionSelected]['text'].toString()),
        ...widgets,
      ],
    );
  }
}
