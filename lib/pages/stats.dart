import 'package:angime/widgets/nsk_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyStats extends StatelessWidget {
  MyStats({Key? key}) : super(key: key);
  int segmentedControlGroupValue = 0;
  final box = GetStorage();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              key: _scaffoldKey, //set state and context

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer()),
        actions: [Image.asset('assets/boy.jpg')],
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: NskDrawer(context: context),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/mountain.jpg"),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 170,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(205, 218, 250, 1)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white70),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 16),
                              child: const Text('Элементарный',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      letterSpacing: 0.16,
                                      color: Color.fromRGBO(55, 55, 55, 1))),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Урок 1',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    letterSpacing: 0.16,
                                    color: Color.fromRGBO(83, 83, 83, 1))),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 7, top: 8),
                          child: LinearPercentIndicator(
                            width: 220.0,
                            lineHeight: 3.0,
                            percent:double.tryParse(box.read('a1').toString())!.isNegative?  0.0:double.parse("0.${box.read('a1')}"),
                            progressColor: Colors.red,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 7),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Остался месяц',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                    letterSpacing: 0.16,
                                    color: Color.fromRGBO(149, 149, 149, 1))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
            ],
          )),
    );
  }
}
