import 'package:flutter/material.dart';

class NskDatePicker extends StatelessWidget {
  final void Function()? onTap;
  final String? start;
  final String? end;
  const NskDatePicker({Key? key, this.onTap, this.start, this.end})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffCDDAF9))),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xff2D60E2),
                  ),
                  Text("  " +start.toString())
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 27, right: 16, top: 10, bottom: 10),
                  child: const Divider(
                    height: 1,
                  )),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xff2D60E2),
                  ),
                  Text("  " + end.toString())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
