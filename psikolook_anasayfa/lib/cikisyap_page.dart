import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/destekAl_page.dart';

class CikisYapPage extends StatefulWidget {
  const CikisYapPage({super.key});

  @override
  State<CikisYapPage> createState() => _CikisYapPageState();
}

class _CikisYapPageState extends State<CikisYapPage> {
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
                'Emin misin ?',
                style: TextStyle(color: Colors.pink, fontSize: 23),
              ),
            ),
            Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                    'Gidişin bizi üzüyor...Bir sorun olduysa uygulamaya dönüp bizden destek alabilirsin',
                    textAlign: TextAlign.center),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: StadiumBorder(),
              child: Container(
                color: Colors.amber,
                width: 200,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'EVET',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: StadiumBorder(),
              child: Container(
                color: Colors.pink,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DestekAlPage()));
                  },
                  child: Text(
                    'DESTEK AL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: StadiumBorder(),
              child: Container(
                color: Colors.blueGrey,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'HAYIR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
