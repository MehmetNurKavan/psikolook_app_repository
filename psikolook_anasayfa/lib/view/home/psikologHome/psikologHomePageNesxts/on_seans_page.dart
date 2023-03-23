import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class OnSeansPage extends StatefulWidget {
  const OnSeansPage({Key? key}) : super(key: key);

  @override
  State<OnSeansPage> createState() => _OnSeansPageState();
}

class _OnSeansPageState extends State<OnSeansPage> {
  int seans = 2;
  String adSoyad = 'Neriman Tılmaz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 30, color: Colors.black),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    'ÖN SEANSLA BELRLEDİĞİNİZ TOPLAM SEANS SAYISINI GİRİNİZ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFFF0390), fontSize: 23),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Card(
                    color: Colors.black,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
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
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('$adSoyad',
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white)),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: const Text(
                                      'STK yönlendirmesi var ücret ödemesi yok',
                                      style: TextStyle(color: Colors.white70),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$adSoyad',
                                    style: const TextStyle(fontSize: 22)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    'Belirlenen Toplam Seans Sayısı',
                                    style: TextStyle(color: Color(0xFFFF0390)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.black,
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.only(
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
      ),
    );
  }
}
