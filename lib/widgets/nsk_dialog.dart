import 'package:flutter/material.dart';

class NskDialog extends StatelessWidget {
  final List<Widget> children;

  const NskDialog({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Form(
            child: Column(mainAxisSize: MainAxisSize.min, children: children)));
  }
}
