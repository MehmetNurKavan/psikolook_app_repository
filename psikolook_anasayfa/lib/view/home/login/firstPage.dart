import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/secondPage.dart';

class sayfa extends StatefulWidget {
  const sayfa({super.key});

  @override
  State<sayfa> createState() => _sayfaState();
}

class _sayfaState extends State<sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => secondPage()));
          },
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: Image.asset("assets/images/psikolook-.png")),
        ),
      ),
    );
  }
}
