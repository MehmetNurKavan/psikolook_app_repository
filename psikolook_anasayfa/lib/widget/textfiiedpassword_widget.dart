import 'package:flutter/material.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const TextFieldPasswordWidget({
    Key? key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              color: Colors.black,
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: "Şifreniz",
          filled: true,
          fillColor: Colors.white),
      onChanged: widget.onChanged,
    );
  }
}
