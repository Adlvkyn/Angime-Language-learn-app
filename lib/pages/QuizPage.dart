// ignore_for_file: unused_import, avoid_print, duplicate_ignore

import 'package:angime/database/questions.dart';
import 'package:angime/pages/quiz_widgets/Quiz.dart';
import 'package:angime/pages/quiz_widgets/Answer.dart';
import 'package:angime/pages/quiz_widgets/Question.dart';
import 'package:angime/pages/quiz_widgets/Result.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < Questions().questionsA1.length) {
      print('У нас еще вопросы');
    } else {
      print('Вопросов больше нет');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset('assets/boy.jpg')],
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/mountain.jpg')),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < Questions().questionsA1.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: Questions().questionsA1,
                  ) //Quiz
                : Result(_totalScore, _resetQuiz),
          ),
        ],
      ), //Padding
    );
  }
}
