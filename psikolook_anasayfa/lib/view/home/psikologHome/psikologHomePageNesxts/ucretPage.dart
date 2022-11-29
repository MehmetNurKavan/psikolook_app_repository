import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ucretpage extends StatefulWidget {
  const ucretpage({super.key});

  @override
  State<ucretpage> createState() => _ucretpageState();
}

class _ucretpageState extends State<ucretpage> {
  int seansAdedi = 1;
  String kisiAdi = 'Neriman Yılmaz';
  String metin = 'STK yönlendirmesi var ücret ödemesi yok';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      child: Icon(Icons.arrow_back_ios_new, size: 30),
                      elevation: 0,
                      backgroundColor: Color(0xFF5CE1E6),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'BURAYI SADECE ÜCRETLİ OLARAK ÇALIŞANLAR KULLANACAKTIR, ÖĞRENCİLERE HERHANGİ BİR ÜCRET ÖDEMESİ YAPILMAYACAKTIR',
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'PSİKOLOOK HESABI',
                      style: TextStyle(color: Color(0xFFFF0390), fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: buildParayiAktarinCard(context),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 30, height: 30),
                        Text(
                          'SEANS ÜCRETİNİZ',
                          style:
                              TextStyle(color: Color(0xFFFF0390), fontSize: 16),
                        ),
                      ],
                    ),
                    buildSeansUcretiCard(1),
                    Text(
                      'Psikolook Psikolog tanıtım bedeli olarak aldığınız ücretten %20 komisyon keser.',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xFF5CE1E6),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('TAMAM'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildParayiAktarinCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Banka Hesap Bilgilerini Gir',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.55,
            child: TextField(
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Buraya iban'ininzi giriniz",
                filled: true,
                fillColor: Color(0xFFFF0390),
                suffixStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xFF5CE1E6),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Text('PARAYI AKTARIN'),
          ),
        ],
      ),
    );
  }

  Card buildSeansUcretiCard(seansAdedi) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$seansAdedi SEANS',
            style: TextStyle(color: Color(0xFF5CE1E6), fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixText: 'TL',
                  filled: true,
                  fillColor: Color(0xFFFF0390),
                  hintText: 'Buraya değer giriniz',
                  hintStyle: TextStyle(color: Colors.white70),
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
          ),
        ],
      ),
    );
  }
}
