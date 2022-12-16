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
        child: Container(
          child: Image.asset("assets/images/psikolook-.png"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const secondPage()));
        },
        label: Text("Hadi Başlayalım",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.pink[400],
            )),
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        splashColor: Colors.pink[500],
        hoverColor: Colors.black,
        icon: Icon(
          Icons.all_inclusive_sharp,
          size: 40.0,
          color: Colors.pink[400],
        ),
      ),
    );
  }
}
