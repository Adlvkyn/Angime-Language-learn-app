// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;
              final box = GetStorage();

  Result(this.resultScore, this.resetHandler);

//Логика результата
  String get resultPhrase {
    String resultText;
    if (resultScore >= 5) {
      resultText = 'Молодец';
      print(resultScore);
    } else {
      resultText = 'Попробуй еще раз';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Баллы: ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text(
              'Вернутся домой',
            ), //Text
            onPressed: () {
              box.write('a1', resultScore);
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ElevatedButton(
            child: Text(
              'Попробовать еще раз',
            ), //Text
            onPressed: resetHandler,
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
