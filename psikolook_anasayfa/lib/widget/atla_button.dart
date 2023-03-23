import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function()? function;
  const NextButton({Key? key, this.function}) : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 15.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ))),
        onPressed: function,
        child: const Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 5),
          child: Text(
            "Atla",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}