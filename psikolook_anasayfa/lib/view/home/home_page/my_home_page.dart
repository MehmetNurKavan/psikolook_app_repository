import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/Iletisim_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/cikisyap_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/hakkimzda_page.dart';
import 'dart:math' as math;

import 'package:psikolook_anasayfa/view/home/home_page/meeting_page.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikolog_icon.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/psikolook_page.dart';
import 'package:psikolook_anasayfa/view/home/topluluk/toplulukPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isVisible = true;
  bool isNotVisible = false;
  String dkk1 = '8';
  String dkk2 = '4';
  String dkk3 = '15';
  String dkk4 = '3';
  String image1 = 'assets/images/woman_picture.png';
  String image2 = 'assets/images/woman_blog.png';
  String image3 = 'assets/images/woman_picture.png';
  String image4 = 'assets/images/woman_blog.png';
  String baslik1 = 'A TİPİ';
  String baslik2 = 'HAYVAN BESLEMENİN ÖNEMİ';
  String baslik3 = 'DOĞA';
  String baslik4 = 'ÇOCUK GELİŞİMİNDE OYUNUN ÖNEMİ';
  String psikologName = 'Henüz Psikologun Yok';
  String psikologText =
      'Sana uygun psikologu bulman için aşağıdaki Psikolook logosuna bas';
  String psikologImage = 'assets/images/woman_picture.png';
  String history = '8 Nisan';
  String otherPsikologName = 'Psikolook';
  String psikologAvatar = 'assets/images/woman_picture.png';
  Color color1 = Color.fromARGB(255, 92, 225, 230);
  Color color2 = Colors.white;
  Color color3 = Color.fromARGB(255, 255, 3, 144);

  String mavi = 'Color.fromARGB(255, 92, 225, 230),';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),
      bottomNavigationBar: builHomeRow(context),
      floatingActionButton: buildPsikolookButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 5,
                child: buildMeetingCardView(
                    context, psikologName, psikologText, psikologImage),
              ),
            ),
            Visibility(
              visible: isNotVisible,
              child: Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: GridView.count(
                    crossAxisCount: 1,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(10),
                    children: [
                      buildBlogCardView(dkk1, baslik1, image1),
                      buildBlogCardView(dkk2, baslik2, image2),
                      buildBlogCardView(dkk3, baslik3, image3),
                      buildBlogCardView(dkk4, baslik4, image4),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: GridView.count(
                    crossAxisCount: 1,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 0.7,
                    children: [
                      buildMidCardView(
                          psikologAvatar, history, otherPsikologName, color1),
                      buildMidCardView(
                          psikologAvatar, history, otherPsikologName, color2),
                      buildMidCardView(
                          psikologAvatar, history, otherPsikologName, color3),
                      buildMidCardView(
                          psikologAvatar, history, otherPsikologName, color1),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isNotVisible,
              child: Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: GridView.count(
                    crossAxisCount: 1,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(10),
                    children: [
                      buildBlogCardView(dkk1, baslik1, image1),
                      buildBlogCardView(dkk2, baslik2, image2),
                      buildBlogCardView(dkk3, baslik3, image3),
                      buildBlogCardView(dkk4, baslik4, image4),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                          isNotVisible = !isNotVisible;
                        });
                      },
                      child: const Text(
                        'Blog Yazılarınınn Tümünü Görmek İçin Tıklayınız.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.pink,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.topLeft,
                child: GridView.count(
                  crossAxisCount: 1,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  children: [
                    buildBlogCardView(dkk1, baslik1, image1),
                    buildBlogCardView(dkk2, baslik2, image2),
                    buildBlogCardView(dkk3, baslik3, image3),
                    buildBlogCardView(dkk4, baslik4, image4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
            onPressed: () {},
            icon: Icon(Icons.home, color: Colors.pink),
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
}

Card buildMeetingCardView(context, psikologName, psikologText, psikologImage) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                  height: 30,
                  width: 375,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 251, 84, 179),
                  ),
                  child: Center(
                    child: Text(
                      psikologName,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(psikologImage),
                radius: 40.0,
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 225,
                    child: Text(
                      psikologText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 90, 216, 216),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Text('Görüşme Linki'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MeetingPage()));
                      },
                    ),
                  )
                ],
              ),
              SizedBox(),
            ],
          ),
        ],
      ),
    ),
  );
}

Card buildBlogCardView(dkk, baslik, image) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Container(
      width: 165, //bunun sayesinde sabitledik mükk oldu
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(image),
          /* colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.dstATop,
            ),//resmi filtriyor 
            */
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
              child: SingleChildScrollView(
                child: Text(
                  baslik,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                  //maxLines: 3,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$dkk dkk',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ),
  );
}

Container buildMidCardView(psikologAvatar, history, otherPsikologName, color) {
  return Container(
    width: 22,
    height: 11,
    child: Card(
      /* color: Color((math.Random().nextDouble() * 0xFFFFF).toInt())
          .withOpacity(1.0), */
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          ListTile(
            //minLeadingWidth: 1,aralarınadki bosluk sanırım
            contentPadding: EdgeInsets.all(1),
            //horizontalTitleGap: 3.0, //başlık ve avatar arasındaki mesafe olamlı
            //minVerticalPadding: 10,
            //minLeadingWidth: 10,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(psikologAvatar),
              ),
            ),
            title: Text(otherPsikologName),
            subtitle: Text(
              history,
            ),
            //isThreeLine: true, //alanını genisletiyor,yerlestiriyor
            dense: true, //alanını daraltiyor gibi
            trailing: Icon(Icons.keyboard_arrow_down),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('Henüz takip ettiğin bir piskolog yok.'),
          ),
        ],
      ),
    ),
  );
}

SizedBox buildPsikolookButton(context) {
  return SizedBox(
    height: 100,
    width: 150,
    child: FloatingActionButton(
      tooltip: 'Psikolook',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PsikolookPage(),
            ));
      },
      backgroundColor: Colors.transparent, //arka planrengini kaldırdı
      elevation: 0,
      child: Image.asset('assets/images/psikolook_logo.png'), //gölgeyi kaldırdı
    ),
  );
}

AppBar buildAppBar(context) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: Color.fromARGB(255, 255, 204, 204),
    elevation: 0,
    actions: <Widget>[
      FloatingActionButton.small(
        child: Image.asset('assets/images/message_icon.png', fit: BoxFit.cover),
        backgroundColor: Colors.transparent,
        elevation: 0,
        tooltip: 'Mesajlar',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MessagePage()));
        },
      ),
    ],
  );
}

Container buildDrawer(context) {
  return Container(
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.4),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Drawer(
        elevation: 0,
        width: MediaQuery.of(context).size.width * 0.28,
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
              color: Colors.white,
              iconSize: 34,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HakkimizdaPage(),
                    ));
              },
              child: Text(
                'HAKKIMIZDA',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IletisimPage(),
                    ));
              },
              child: Text(
                'DESTEK',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IletisimPage(),
                    ));
              },
              child: Text(
                'İLETİŞİM',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => kvkk(),
                          )); */
              },
              child: Text(
                'KVKK',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CikisYapPage()),
                );
              },
              child: Text(
                'Çıkış Yap',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
