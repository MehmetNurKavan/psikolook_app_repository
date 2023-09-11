import 'package:flutter/material.dart';

class PsikolookLoading extends StatelessWidget {
  const PsikolookLoading({Key? key}) : super(key: key);

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
