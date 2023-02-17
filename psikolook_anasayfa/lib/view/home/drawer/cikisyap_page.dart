import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psikolook_anasayfa/view/home/drawer/destekAl_page.dart';

class CikisYapPage extends StatefulWidget {
  const CikisYapPage({super.key});

  @override
  State<CikisYapPage> createState() => _CikisYapPageState();
}

class _CikisYapPageState extends State<CikisYapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 215, 226),
      body: buildCikisYap(context),
    );
  }

  Center buildCikisYap(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 234, 240),
              Color.fromARGB(255, 255, 244, 244),
              Color.fromARGB(255, 255, 254, 248),
            ],
          ),
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(100)),
          ),
          color: Colors.white,
          margin:
              const EdgeInsets.only(bottom: 150, top: 150, left: 35, right: 35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Container(
                  child: const Text(
                    'Emin misin ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: [
                        const Text('Gidişin bizi üzüyor...',
                            textAlign: TextAlign.center),
                        Text(
                            'Bir sorun olduysa uygulamaya dönüp bizden destek alabilirsin',
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 217, 167, 179)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text(
                      'EVET',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 128, 192, 210),
                            Color.fromARGB(255, 128, 192, 210),
                            Color.fromARGB(255, 227, 235, 232),
                          ])),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DestekAlPage()));
                    },
                    child: const Text(
                      'DESTEK AL',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'HAYIR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
