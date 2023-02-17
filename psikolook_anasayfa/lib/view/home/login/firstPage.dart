import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/secondPage.dart';

class sayfa extends StatefulWidget {
  const sayfa({super.key});

  @override
  State<sayfa> createState() => _sayfaState();
}

class _sayfaState extends State<sayfa> {
  
void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => secondPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login1.png"),fit: BoxFit.fill)),
          
        )
      ),
    );
  }
}
