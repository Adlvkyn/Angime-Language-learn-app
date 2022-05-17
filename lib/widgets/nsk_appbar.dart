import 'package:flutter/material.dart';


class NskAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? isUnderText;
  final String? label;
  final String? underLabel;
  final bool disableLeading;
  const NskAppBar(
      {Key? key,
      this.isUnderText,
      this.label,
      this.underLabel,
      required this.disableLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: disableLeading
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Color.fromRGBO(45, 96, 226, 1)),
              onPressed: () {

              },
            ),
      title: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(label!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      letterSpacing: 0.16,
                      color: Color.fromRGBO(10, 10, 10, 1))),
            ),
          ),
          if (isUnderText == true)
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(underLabel!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        letterSpacing: 0.16,
                        color: Color.fromRGBO(109, 109, 109, 1))),
              ),
            )
        ],
      ),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
