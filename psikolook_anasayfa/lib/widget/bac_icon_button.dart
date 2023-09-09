import 'package:flutter/material.dart';

class BackIconButton2 extends StatelessWidget {
  const BackIconButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 34,
      ),
    );
  }
}
