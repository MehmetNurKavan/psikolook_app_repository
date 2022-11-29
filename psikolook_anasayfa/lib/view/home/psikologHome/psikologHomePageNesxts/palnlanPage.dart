import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  String tarih = 'Tarih:';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 22),
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
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tarih: ',
                        style: TextStyle(
                          color: Color(0xFF5CE1E6),
                        ),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy').format(DateTime.now()),
                        style: TextStyle(
                          color: Color(0xFF5CE1E6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 0,
                color: Color(0xFF5CE1E6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'PLANLANILMIŞ SEANSLARIN',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildSeansGecmisiCard('00.00', 'Henüz Danışanın Yok'),
              SizedBox(height: 15),
              buildSeansGecmisiCard('8.15', 'Alperen Kalaycı'),
              SizedBox(height: 15),
              buildSeansGecmisiCard('14.47', 'Berk Altun'),
              SizedBox(height: 15),
              buildSeansGecmisiCard('18.45', 'Nedime Başak'),
              SizedBox(height: 15),
              buildSeansGecmisiCard('20.00', 'Rabia Albayrak'),
            ],
          ),
        ),
      ),
    );
  }

  Card buildSeansGecmisiCard(seansSaati, kisiAdi) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$seansSaati',
              style: TextStyle(color: Color(0xFF5CE1E6), fontSize: 25)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    kisiAdi,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFF0390),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFF0390),
                      hintText: 'Zoom Linki Ekle',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
