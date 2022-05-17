import 'package:flutter/material.dart';

class NskCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final bool isConfirm;

  const NskCheckbox( 
      {Key? key, required this.value, this.onChanged, required this.title, required this.isConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0xff007AFF);
    }

    return  Padding(
      padding: const EdgeInsets.only( right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: value,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              title,
              softWrap: true,
              style:  TextStyle(
                fontSize: isConfirm? 14: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.16,
                color:const Color(0xff373737),
              ),
            ),
          )
        ],
      ),
    
);  }
}
