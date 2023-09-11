import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_share.dart';
import 'package:psikolook_anasayfa/view/psikologhome/blog/choose_screen_page.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/destekAl_page.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/partner/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/partner/message/message_page.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/palnlanPage.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/psikolog_psikolook_page.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/seansGecmisiPAge.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/seans_islemleri_page.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologprofil/psikolog_profil.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/toplulukPage.dart';

class PsikologHome extends StatefulWidget {
  const PsikologHome({Key? key}) : super(key: key);

  @override
  State<PsikologHome> createState() => _PsikologHomeState();
}

class _PsikologHomeState extends State<PsikologHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor[backGroundColor.length - 1],
      appBar: buildAppBar(context),
      drawer: const buildDrawerWidget(),
      bottomNavigationBar: buildButtonNavigatorBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildPsikolookButton(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 80.0, right: 80.0, bottom: 10.0, top: 10.0),
                    child: Text(
                      'Profilin Onaylandı',
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildRow(
                Image.asset('assets/images/card_icon.png'),
                'Seans\nİşlemleri',
                const SeansIslemleriPage(),
                Image.asset('assets/images/clock_icon.png'),
                'Planlanılmış\nSeanslar',
                const PlanPage(),
              ),
              buildRow(
                Image.asset('assets/images/flag_icon.png'),
                'Blog/Post\nPaylaş',
                const ChooseScreen(),
                Image.asset('assets/images/hand_icon.png'),
                'Bizden\nDestek Al',
                const DestekAlPage(),
              ),
              buildRow(
                Image.asset('assets/images/forum_icon.png'),
                'Psikolog\nFormu',
                const BilimeKatkiPage(),
                Image.asset('assets/images/hand2_icon.png'),
                'Seans\nGeçmişiniz',
                const SeansGecmisiPAge(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow(icon1, text, pageClassName1, icon2, text2, pageClassName2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(25.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageClassName1));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50, height: 50, child: icon1),
                        Text(text,
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageClassName2));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50, height: 50, child: icon2),
                        Text(
                          text2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox buildPsikolookButton(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      child: FloatingActionButton(
        tooltip: 'Psikolook',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PsikologPsikolookIcon(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                ),
              ));
        },
        backgroundColor: Colors.transparent, //arka planrengini kaldırdı
        elevation: 0,
        child: Image.asset('assets/images/psikolook_logo.png'),
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 248, 230, 228),
      elevation: 0,
      actions: <Widget>[
        FloatingActionButton.small(
          backgroundColor: Colors.transparent,
          elevation: 0,
          tooltip: 'Mesajlar',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MessagePage()));
          },
          child: Image.asset('assets/images/chat_icon.png', fit: BoxFit.cover),
        ),
      ],
    );
  }

  Container buildButtonNavigatorBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              tooltip: 'Ana Sayfa',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PsikologHome()));
              },
              icon: Image.asset('assets/images/home_icon.png'),
              iconSize: 40,
            ),
            IconButton(
              tooltip: 'Bilime Katkı',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BilimeKatkiShare()));
              },
              icon: Image.asset(
                'assets/images/lab_icon.png',
                fit: BoxFit.contain,
              ),
              iconSize: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            IconButton(
              tooltip: 'Topluluk',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToplulukPage()));
              },
              icon: Image.asset('assets/images/perosn_two_icon.png'),
              iconSize: 40,
            ),
            IconButton(
              tooltip: 'Profil',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PsikologProfil(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                            )));
              },
              icon: Image.asset('assets/images/person_icon.png'),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
