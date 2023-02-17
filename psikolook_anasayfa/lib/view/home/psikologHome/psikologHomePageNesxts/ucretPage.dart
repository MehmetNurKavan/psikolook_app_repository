import 'package:flutter/material.dart';

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
                        child: const Icon(Icons.arrow_back_ios_new, size: 30),
                        elevation: 0,
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'BURAYI SADECE ÜCRETLİ OLARAK ÇALIŞANLAR KULLANACAKTIR, ÖĞRENCİLERE HERHANGİ BİR ÜCRET ÖDEMESİ YAPILMAYACAKTIR',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'PSİKOLOOK HESABI',
                        style:
                            TextStyle(color: Color(0xFFFF0390), fontSize: 14),
                      ),
                      const SizedBox(height: 10),
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
                          const SizedBox(width: 30, height: 30),
                          const Text(
                            'SEANS ÜCRETİNİZ',
                            style: TextStyle(
                                color: Color(0xFFFF0390), fontSize: 16),
                          ),
                        ],
                      ),
                      buildSeansUcretiCard(1),
                      const Text(
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
                                Colors.black,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('TAMAM'),
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
            child: const Text(
              'Banka Hesap Bilgilerini Gör',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.55,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.decal,
                  colors: [
                    Color.fromARGB(255, 248, 229, 228),
                    Color.fromARGB(255, 252, 246, 238),
                    Color.fromARGB(255, 252, 246, 238),
                    Color.fromARGB(255, 252, 246, 238),
                    Color.fromARGB(255, 248, 229, 228),
                  ],
                ),
              ),
              child: const TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  //hintText: "Buraya iban'ininzi giriniz",
/*                 filled: true,
                  fillColor: Color(0xFFFF0390), */
                  suffixText: 'TL',
                  suffixIconColor: Colors.black,
                  suffixStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.black,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ),
            onPressed: () {},
            child: const Text('PARAYI AKTARIN'),
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
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    colors: [
                      Color.fromARGB(255, 248, 229, 228),
                      Color.fromARGB(255, 252, 246, 238),
                      Color.fromARGB(255, 252, 246, 238),
                      Color.fromARGB(255, 252, 246, 238),
                      Color.fromARGB(255, 248, 229, 228),
                    ],
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixText: 'TL',
                    suffixIconColor: Colors.black,
                    hintText: 'Buraya değer giriniz',
                    hintStyle: TextStyle(color: Colors.black),
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
          ),
        ],
      ),
    );
  }
}
