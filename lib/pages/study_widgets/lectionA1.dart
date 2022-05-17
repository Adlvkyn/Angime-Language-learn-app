import 'package:angime/widgets/nsk_button.dart';

import 'package:angime/widgets/nsk_title.dart';
import 'package:flutter/material.dart';

// обычные джсоныобразные уроки для стягивание в UI часть
class LectionA1 extends StatelessWidget {
  const LectionA1({Key? key}) : super(key: key);
  final lectionsA1 = const [
    {
      'text': 'сәлем - привет',
    },
    {
      'text': 'қалың қалай? - как дела?',
    },
    {
      'text': 'ана - мама',
    },
    {
      'text': 'әке - папа',
    },
    {
      'text': 'аға - брат',
    },
    {
      'text': 'тәте - сестра',
    },
    {
      'text': 'үй - дом',
    },
    {
      'text': 'көлік - машина',
    },
    {
      'text': 'қол - рука',
    },
    {
      'text': 'аяқ - нога',
    },
    {
      'text': 'әже - бабушка',
    },
    {
      'text': 'ата - дедушка',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        actions: [Image.asset('assets/boy.jpg')],
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
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: NskTitle(
                      title: lectionsA1[index]['text']!,
                    ),
                  ),
                  childCount: lectionsA1.length,
                ),
              ),
              SliverToBoxAdapter(
                child: NskButton(
                  text: "Начать тест",
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "/test"),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              )
            ],
          ),
        ],
      ),
    );
  }
}
