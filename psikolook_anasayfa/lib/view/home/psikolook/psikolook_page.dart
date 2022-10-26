import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/buy_sally_page.dart';

class PsikolookPage extends StatefulWidget {
  const PsikolookPage({super.key});

  @override
  State<PsikolookPage> createState() => _PsikolookPageState();
}

class _PsikolookPageState extends State<PsikolookPage> {
  String resim = 'assets/images/woman_picture.png';
  String ilgiAlani =
      'Anksiyete bozukluğu, stres yönetimi, okb ve aile içi ilişkiler';
  String psikologadi = "PSİKOLOG SELİN AYDIN";
  String psikologadi2 = "PSİKOLOG MELİH TAŞÇIOĞLU";
  int para1 = 200;
  int para2 = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 90, 216, 216),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: Center(
                      child:
                          const Text('REFERANS KODUN VARSA BURADAN DESTEK AL')),
                  onPressed: () {/* ... */},
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
                flex: 3,
                child: buildPsikologCard(
                    context, resim, ilgiAlani, psikologadi, para1)),
            SizedBox(height: 10),
            Expanded(
                flex: 3,
                child: buildPsikologCard(
                    context, resim, ilgiAlani, psikologadi2, para2)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Card buildPsikologCard(
      BuildContext context, image, text, psikologname, para) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 237, 36, 150),
              Color.fromARGB(255, 237, 36, 150),
              Color.fromARGB(255, 237, 36, 150),
              Color.fromARGB(255, 237, 36, 150),
              Color.fromARGB(255, 254, 112, 145),
              Color.fromARGB(255, 248, 170, 158),
              Color.fromARGB(255, 253, 210, 130),
            ],
          ),
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 251, 84, 179),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(top: 8, left: 20),
                        child: Text(
                          psikologname,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 50.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 90, 216, 216),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    child: const Text('Profili İncele'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.pink[50],
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    child: Text('1 SEANS $para TL'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const buySallyPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
