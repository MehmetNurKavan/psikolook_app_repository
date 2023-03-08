import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0, style: BorderStyle.none),
          borderRadius:
              BorderRadius.all(Radius.circular(20))),
      hintText: hintText,
      filled: true,
      fillColor: Colors.white),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
