import 'package:flutter/material.dart';

class NskTitle extends StatelessWidget {
  final String title;
  const NskTitle({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                width: 400,
                margin:const EdgeInsets.only(top: 20, left: 15),
                child: Text(title,
                    style:const  TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        letterSpacing: 0.16,
                        color: Color.fromRGBO(55, 55, 55, 1))),
              );
  }
}