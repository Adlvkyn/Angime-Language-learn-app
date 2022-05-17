import 'package:angime/pages/quiz_widgets/Answer.dart';
import 'package:angime/pages/quiz_widgets/Question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
final List<Map<String, dynamic>> questions;
final int questionIndex;
final Function answerQuestion;

Quiz({
	required this.questions,
	required this.answerQuestion,
	required this.questionIndex,
});

@override
Widget build(BuildContext context) {
	return Column(
	children: [
		Question(
		questions[questionIndex]['questionText']!,
		), //Question
		...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
			.map((answer) {
		return Answer(() => answerQuestion(answer['score']), answer['text'].toString());
		}).toList()
	],
	); //Column
}
}

