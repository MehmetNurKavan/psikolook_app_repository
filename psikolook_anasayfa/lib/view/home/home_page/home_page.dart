/* import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/Iletisim_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/cikisyap_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/hakkimzda_page.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/psikolook_page.dart';
import 'package:psikolook_anasayfa/view/home/topluluk/toplulukPage.dart';

class homePage_ extends StatefulWidget {
  const homePage_({super.key});

  @override
  State<homePage_> createState() => _homePage_State();
}

class _homePage_State extends State<homePage_> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    BilimeKatkiPage(),
    PsikolookPage(),
    PsikolookPage(),
    PsikolookPage(),
    ToplulukPage(),
    HomePage_Person(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 222, 228),
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 204, 204),
              Color.fromARGB(255, 250, 234, 240),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 219, 233, 234),
              Color.fromARGB(255, 192, 222, 228),
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButton: buildPsikolookButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  SizedBox buildPsikolookButton() {
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
        child:
            Image.asset('assets/images/psikolook_logo.png'), //gölgeyi kaldırdı
      ),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,

          //type: BottomNavigationBarType.shifting, //seçienin yukarı ve ortaya yakınlastırıyor
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.pink),
              activeIcon: Icon(Icons.home, color: Colors.pink),
              label: '',
              tooltip: 'Ana Sayfa',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined, color: Colors.pink),
              activeIcon: Icon(Icons.science, color: Colors.pink),
              label: '',
              tooltip: 'Bilime Katkı',
            ),
            const BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_add_outlined, color: Colors.pink),
              activeIcon: Icon(Icons.person_add, color: Colors.pink),
              label: '',
              tooltip: 'Topluluk',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.pink),
              activeIcon: Icon(Icons.person, color: Colors.pink),
              label: '',
              tooltip: 'Profilim',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Color.fromARGB(255, 255, 204, 204),
      elevation: 0,
      actions: <Widget>[
        FloatingActionButton.small(
          child:
              Image.asset('assets/images/message_icon.png', fit: BoxFit.cover),
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

  Container buildDrawer() {
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
}
 */