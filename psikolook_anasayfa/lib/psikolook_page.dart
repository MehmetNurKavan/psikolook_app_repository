import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:psikolook_anasayfa/buy_sally_page.dart';

class PsikolookPage extends StatefulWidget {
  const PsikolookPage({super.key});

  @override
  State<PsikolookPage> createState() => _PsikolookPageState();
}

class _PsikolookPageState extends State<PsikolookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
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
            Expanded(flex: 3, child: buildPsikologCard(context)),
            SizedBox(height: 10),
            Expanded(flex: 3, child: buildPsikologCard(context)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Card buildPsikologCard(BuildContext context) {
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
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[300],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.only(top: 8, left: 20),
                        child: Text(
                          'PSİKOLOG SELİN AYDIN',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/woman_picture.png'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Anksiyete bozukluğu, stres yönetimi, okb ve aile içi ilişkiler',
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
                    child: const Text('1 SEANS 200TL'),
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
