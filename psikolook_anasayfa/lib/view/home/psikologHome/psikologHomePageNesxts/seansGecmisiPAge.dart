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
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
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
              SizedBox(height: 15),
              Text(
                'SEANS GEÇMİŞİNİZ',
                style: TextStyle(color: Color(0xFFFF0390), fontSize: 23),
              ),
              SizedBox(height: 40),
              buildSeansGecmisiCard(1, '$adSoyad1'),
              SizedBox(height: 15),
              buildSeansGecmisiCard(1, 'Alperen Kalaycı'),
              SizedBox(height: 15),
              buildSeansGecmisiCard(2, 'Berk Altun'),
              SizedBox(height: 15),
              buildSeansGecmisiCard(2, 'Nedime Başak'),
              SizedBox(height: 15),
              buildSeansGecmisiCard(1, 'Rabia Albayrak'),
            ],
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
              builder: (context) => OnSeansPage(),
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
                style: TextStyle(color: Color(0xFF5CE1E6), fontSize: 25)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kisiAdi, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: Text(metin),
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
