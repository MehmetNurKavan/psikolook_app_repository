import 'package:flutter/material.dart';

import 'basliik_kartlari.dart';
import 'very_soon7.dart';
import 'very_soon8.dart';
import 'very_soon9.dart';

class very_soon1 extends StatelessWidget {
  const very_soon1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //geri butonu
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    //forum yazısı
                    Container(
                      padding: EdgeInsets.all(7),
                      width: 226,
                      height: 41,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Text("PSİKOLOOK FORUM",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.auto_stories_rounded)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.message_outlined)),
                  ],
                ),
              ),
              /////////////////////
              Padding(
                  padding: const EdgeInsets.only(top: 100, right: 200),
                  child: GestureDetector(
                    child: Text(
                      "Son Eklenen Başlıklar",
                      style:
                          TextStyle(color: Colors.red.shade300, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => very_soon7(),
                          ));
                    },
                  )),
              /////////////////////
              baslik_kartlari(),
              baslik_kartlari(),
              baslik_kartlari(),
              baslik_kartlari(),
              baslik_kartlari(),
              //////////////////////
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 200),
                  child: GestureDetector(
                    child: Text(
                      "Son Eklenen Sorular",
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => very_soon9(),
                          ));
                    },
                  )),
              /////////////////////
              soru_kartlari(),
              soru_kartlari(),
              soru_kartlari(),
              /////////////////////
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 250),
                  child: GestureDetector(
                    child: Text(
                      "Konular",
                      style: TextStyle(color: Colors.yellow, fontSize: 30),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => very_soon8(),
                          ));
                    },
                  )),
              /////////////////////
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
            ],
          ),
        ));
  }
}
