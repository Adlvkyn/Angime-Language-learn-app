import 'package:flutter/material.dart';

class TutorPage extends StatelessWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset('assets/boy.jpg')],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/mountain.jpg"),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth),
        ),
        child: CustomScrollView(slivers: [
        SliverPadding(padding: EdgeInsets.only(left: 25,right: 25,top: 25),sliver:   SliverList(
              delegate: SliverChildListDelegate.fixed([
            Container(
              
              child: ElevatedButton(
                child: Text("Урок 1"),
                onPressed: () {
                  Navigator.pushNamed(context, "/home/lections/a1");
                },
              ),
            ),
             Container(
              
              child: ElevatedButton(
                child: Text("Урок 2"),
                onPressed: () {
                },
              ),
            ),  Container(
              
              child: ElevatedButton(
                child: Text("Урок 3"),
                onPressed: () {
                },
              ),
            ),  Container(
              
              child: ElevatedButton(
                child: Text("Урок 4"),
                onPressed: () {
                },
              ),
            ),  Container(
              
              child: ElevatedButton(
                child: Text("Урок 5"),
                onPressed: () {
                },
              ),
            ),
          ])),)
        ]),
      ),
    );
  }
}
