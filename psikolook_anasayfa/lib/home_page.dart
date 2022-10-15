import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool deger = true;
  @override
  Widget build(BuildContext context) {
    if (deger == true) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: buildCard_oneView(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: 375,
                alignment: Alignment.topCenter,
                child: GridView.count(
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCard_twoView(),
                    buildCard_twoView(),
                    buildCard_twoView(),
                    buildCard_twoView(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      deger = false;
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
                    buildCard_threeView(),
                    buildCard_threeView(),
                    buildCard_threeView(),
                    buildCard_threeView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                deger = true;
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              child: GridView.count(
                crossAxisCount: 3,
                primary: false,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                children: [
                  buildCard_threeView(),
                  buildCard_threeView(),
                  buildCard_threeView(),
                  buildCard_threeView(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Card buildCard_oneView() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Colors.pinkAccent,
              Colors.pinkAccent,
              Colors.amberAccent,
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
                      color: Colors.pink[300],
                    ),
                    child: const Center(
                      child: Text(
                        'Henüz Psikologun Yok',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
                  backgroundImage:
                      AssetImage('assets/images/woman_picture.png'),
                  radius: 40.0,
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      width: 225,
                      child: Text(
                        'Sana uygun psikologu bulman için aşağıdaki Psikolook logosuna bas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Color.fromARGB(255, 90, 216, 216),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Görüşme Linki'),
                        onPressed: () {/* ... */},
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

  Card buildCard_threeView() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: 165, //bunun sayesinde sabitledik mükk oldu
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: const AssetImage('assets/images/woman_picture.png'),
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
//            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 302132,
                height: 50,
                child: const Text(
                  'ÇOCUK GELİŞİMİNDE OYUNUN ÖNEMİ', //bu uzun olursa genişliyoru, coz bunu
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Text(
                '8 dkk',
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white70,
                ),
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
}

Container buildCard_twoView() {
  return Container(
    width: 22,
    height: 11,
    child: Card(
      color: Color((math.Random().nextDouble() * 0xFFFFF).toInt())
          .withOpacity(1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          const ListTile(
            //minLeadingWidth: 1,aralarınadki bosluk sanırım
            contentPadding: EdgeInsets.all(1),
            horizontalTitleGap: 3.0, //başlık ve avatar arasındaki mesafe olamlı
            minVerticalPadding: 10,
            //minLeadingWidth: 10,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/woman_picture.png'),
              ),
            ),
            title: Text('Psikolook'),
            subtitle: Text(
              '8 Nisan',
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
