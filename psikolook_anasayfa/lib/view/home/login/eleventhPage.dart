import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/TwelfthPage.dart';

class EleventhPage extends StatefulWidget {
  const EleventhPage({super.key});

  @override
  State<EleventhPage> createState() => _EleventhPageState();
}

class _EleventhPageState extends State<EleventhPage> {
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
                  MaterialPageRoute(builder: (context) => const TwelfthPage()));
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
                  image: AssetImage("assets/images/login11.png"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
