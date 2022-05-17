// ignore_for_file: file_names, avoid_print

import 'package:angime/database/lections.dart';
import 'package:angime/widgets/nsk_button.dart';
import 'package:angime/widgets/nsk_drawer.dart';
import 'package:angime/widgets/nsk_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset: false,

            key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () =>
    _scaffoldKey.currentState!.openDrawer()  
        ),
        actions: [Image.asset('assets/boy.jpg')],
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: NskDrawer(
        context: context,
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/mountain.jpg')),
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const NskTitle(title: "Выберите уровень"),
                  NskButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home/lections");
                      print(Lections().lectionsA1[1]['text']);
                    },
                    text: "A1 Элементарный",
                  ),
                  NskButton(
                    onPressed: () {},
                    text: "A2 Базовый",
                  ),
                  NskButton(
                    onPressed: () {},
                    text: "B1 Средний",
                  ),
                  NskButton(
                    onPressed: () {},
                    text: "B2 Выше стреднего",
                  ),
                  NskButton(
                    onPressed: () {},
                    text: "C1 Высокий",
                  ),
                  NskButton(
                    onPressed: () {},
                    text: "C2 Профессиональный",
                  ),
                ]),
              )
            ],
          ),
        ],
      ), //Padding
    );
  }
}
