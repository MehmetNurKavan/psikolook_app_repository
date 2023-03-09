import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white),
      onChanged: onChanged,
    );
  }
}
