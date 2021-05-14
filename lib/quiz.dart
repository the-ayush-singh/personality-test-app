import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final Function answerQ;

  Quiz({
    @required this.answerQ,
    @required this.questions,
    @required this.quesIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[quesIndex]['questionText'],
        ),
        ...(questions[quesIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQ(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
