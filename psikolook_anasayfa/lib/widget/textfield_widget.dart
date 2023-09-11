import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType=TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white),
    );
  }
}
