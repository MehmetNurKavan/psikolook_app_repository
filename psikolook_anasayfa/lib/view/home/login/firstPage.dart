import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/IntroducingPage.dart';

class sayfa extends StatefulWidget {
  const sayfa({Key? key}) : super(key: key);

  @override
  State<sayfa> createState() => _sayfaState();
}

class _sayfaState extends State<sayfa> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const IntroducingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/FirstPageBackGround.png"),
                  fit: BoxFit.cover)),
          child: Center(child: Image.asset("assets/images/logo_kucuk.png")),
        ),
      ),
    );
  }
}
