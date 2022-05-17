import 'package:flutter/material.dart';

class NskCard extends StatelessWidget {
  final String title;
  final Icon icons;
  final void Function()? onPressed;
  const NskCard({Key? key, required this.title, required this.icons, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Color.fromRGBO(205, 218, 250, 1),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(right: 60),
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    icon: icons,
                    onPressed: onPressed,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        letterSpacing: 0.16,
                        color: Color.fromRGBO(45, 96, 226, 1))),
              ),
            ],
          ),
        ));
  }
}
