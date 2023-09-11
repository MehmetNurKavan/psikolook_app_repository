import 'dart:io';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/partner/login/IntroducingPage.dart';
import 'package:psikolook_anasayfa/widget/tryagain.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isInternet = true;
  internetController() {
    InternetAddress.lookup('google.com').then((result) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternet = true;
      } else {
        isInternet = false;
      }
    });
  }

  @override
  void initState() {
    internetController();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isInternet ? const IntroducingPage() : const TryAgainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/FirstPageBackGround.png"),
                fit: BoxFit.cover)),
        child: Center(child: Image.asset("assets/images/logo_kucuk.png")),
      ),
    );
  }
}
