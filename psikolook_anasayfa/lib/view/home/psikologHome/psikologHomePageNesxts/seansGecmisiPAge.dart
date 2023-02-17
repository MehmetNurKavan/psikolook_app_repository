import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/core/base/state/StateData.dart';

import 'on_seans_page.dart';

class SeansGecmisiPAge extends StatefulWidget {
  const SeansGecmisiPAge({super.key});

  @override
  State<SeansGecmisiPAge> createState() => _SeansGecmisiPAgeState();
}

class _SeansGecmisiPAgeState extends State<SeansGecmisiPAge> {
  String metin = 'STK yönlendirmesi var ücret ödemesi yok';
  @override
  Widget build(BuildContext context) {
    String adSoyad1 = Provider.of<StateData>(context).adSoyad;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 236, 241),
              Color.fromARGB(255, 254, 243, 244),
              Color.fromARGB(255, 255, 248, 245),
              Color.fromARGB(255, 255, 252, 247),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      child: const Icon(Icons.arrow_back_ios_new, size: 30),
                      elevation: 0,
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'SEANS GEÇMİŞİNİZ',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                const SizedBox(height: 40),
                buildSeansGecmisiCard(1, '$adSoyad1'),
                const SizedBox(height: 15),
                buildSeansGecmisiCard(1, 'Alperen Kalaycı'),
                const SizedBox(height: 15),
                buildSeansGecmisiCard(2, 'Berk Altun'),
                const SizedBox(height: 15),
                buildSeansGecmisiCard(2, 'Nedime Başak'),
                const SizedBox(height: 15),
                buildSeansGecmisiCard(1, 'Rabia Albayrak'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildSeansGecmisiCard(seansAdedi, kisiAdi) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnSeansPage(),
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$seansAdedi SEANS',
                style: const TextStyle(color: Colors.black, fontSize: 25)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kisiAdi, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: Text(metin,
                        style: const TextStyle(color: Color(0xFFFF0390))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
