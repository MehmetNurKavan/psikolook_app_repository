import 'dart:ui';

import 'package:flutter/material.dart';

class OnSeansPage extends StatefulWidget {
  const OnSeansPage({super.key});

  @override
  State<OnSeansPage> createState() => _OnSeansPageState();
}

class _OnSeansPageState extends State<OnSeansPage> {
  int seans = 2;
  String adSoyad = 'Neriman Tılmaz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 15),
                  FloatingActionButton.small(
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: 'geri',
                    child: Icon(Icons.arrow_back_ios_new, size: 30),
                    elevation: 0,
                    backgroundColor: Color(0xFF5CE1E6),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'ÖN SEANSLA BELRLEDİĞİNİZ TOPLAM SEANS SAYISINI GİRİNİZ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFFF0390), fontSize: 23),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('$seans SEANS',
                              style: TextStyle(
                                  color: Color(0xFF5CE1E6), fontSize: 25)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$adSoyad', style: TextStyle(fontSize: 22)),
                              SizedBox(height: 10),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                      'STK yönlendirmesi var ücret ödemesi yok')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('$adSoyad', style: TextStyle(fontSize: 22)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  'Belirlenen Toplam Seans Sayısı',
                                  style: TextStyle(color: Color(0xFFFF0390)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFFF0390)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 10,
                                      top: 10),
                                  child: Text(
                                    'TAMAM',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
