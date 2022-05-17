import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NskTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool? enabled;
  final FocusNode? focusNode;
  final int? maxLength;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;


  const NskTextField({Key? key,this.textInputAction,this.onFieldSubmitted,this.inputFormatters,this.suffix,this.onChanged,this.autoFocus,this.maxLength,this.focusNode, this.label,this.controller,this.keyboardType,this.validator,this.enabled,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
      child: TextFormField(
        textInputAction: textInputAction,
        autofocus: autoFocus?? false,
        inputFormatters:inputFormatters,
        focusNode: focusNode,
        onChanged: onChanged,
        enabled: enabled,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator ,
        controller:controller ,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon:suffix,
            labelText: label,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                letterSpacing: 1,
                color: Color.fromRGBO(83, 83, 83, 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(205, 218, 249, 1),
                    width: 2))),
      ));
  }
}
