import 'package:flutter/material.dart';



class AddButtonNsk extends StatelessWidget {
  const AddButtonNsk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: OutlinedButton(
          child: const Text(
            "+",
            style:  TextStyle(fontSize: 50.0),
          ),
          onPressed: () {
          },
          style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(13),
              side: const BorderSide(color: Colors.blue)),
        ));
  }
}
