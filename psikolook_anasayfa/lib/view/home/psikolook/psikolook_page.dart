import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/buy_sally_page.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/referansPage.dart';
import 'package:psikolook_anasayfa/view/home/topluluk/toplulukPage.dart';

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
  bool isVisible = true;
  bool isNotVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: builHomeRow(context),
      floatingActionButton: buildPsikolookButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
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
        child: ListView(
          primary: false,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    colors: [
                      Color.fromARGB(255, 221, 226, 237),
                      Color.fromARGB(255, 214, 206, 237),
                      Color.fromARGB(255, 210, 196, 237),
                      Color.fromARGB(255, 204, 187, 237),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const referansPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.transparent),
                  child: Text(
                    'REFERANS KODUN VARSA BURADAN ÜCRETSİZ DESTEK AL',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildPsikologCard(context, resim, ilgiAlani, psikologadi, para1),
            const SizedBox(height: 10),
            buildPsikologCard(context, resim, ilgiAlani, psikologadi2, para2),
            const SizedBox(height: 30),
            buildPsikologCard(context, resim, ilgiAlani, psikologadi2, para2),
            const SizedBox(height: 10),
            buildPsikologCard(context, resim, ilgiAlani, psikologadi2, para2),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Card buildPsikologCard(
      BuildContext context, image, text, psikologname, para) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      psikologname,
                      //style: const TextStyle(color: Colors.white),
                    )),
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
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
                const SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black87,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    child: const Text('Profili İncele'),
                    onPressed: () {},
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black, width: 1)),
                    foregroundColor: Colors.black87,
                    //visualDensity: VisualDensity.standard,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container builHomeRow(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.09,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homePage()));
          },
          icon: Icon(Icons.home_outlined, color: Colors.pink),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BilimeKatkiPage()));
          },
          icon: Icon(Icons.science_outlined, color: Colors.pink),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ToplulukPage()));
          },
          icon: Icon(Icons.person_add_outlined, color: Colors.pink),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage_Person()));
          },
          icon: Icon(Icons.person_outline, color: Colors.pink),
        ),
      ],
    ),
  );
}
