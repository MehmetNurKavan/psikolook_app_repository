import 'package:flutter/material.dart';
import 'fourthPage.dart';

class thirdPage extends StatefulWidget {
  const thirdPage({super.key});

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 15.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const fourthPage()));
            },
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 5),
              child: Text(
                "Atla",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login3.png"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
