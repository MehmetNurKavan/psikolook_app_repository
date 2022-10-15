import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class DestekAlPage extends StatefulWidget {
  const DestekAlPage({super.key});

  @override
  State<DestekAlPage> createState() => _DestekAlPage();
}

class _DestekAlPage extends State<DestekAlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: buildCikisYap(context),
    );
  }

  Center buildCikisYap(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100), topRight: Radius.circular(100)),
        ),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 150, top: 150, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            Container(
              child: Text(
                'Destek Al',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 23,
                  //fontWeight: ,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Bir sorun mu var?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            InkWell(
                child: new Text(
                  'ppsikolook@gmail.com',
                  style: TextStyle(fontSize: 20, color: Colors.pink),
                ), //psikolok gelecek de bakalim
                onTap: () => launch('https://mail.google.com')),
            Container(
              width: 200,
              child: Text(
                'Mail atarak bizimle iletişime geç',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: StadiumBorder(),
              child: Container(
                color: Colors.blueAccent,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Tamam',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
