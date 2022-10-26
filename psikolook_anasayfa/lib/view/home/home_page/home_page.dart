import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/drawer/Iletisim_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/cikisyap_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/hakkimzda_page.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/psikolook_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    PsikolookPage(),
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
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  /* FloatingActionButton buildPsikolookButton() {
    return FloatingActionButton(
      tooltip: 'Psikolook',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PsikolookPage()),
        );
      },
      backgroundColor: Colors.transparent, //arka planrengini kaldırdı
      elevation: 0,
      child: Image.asset('assets/images/fb_logo.png'), //gölgeyi kaldırdı
    );
  } */

  Padding buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            //type: BottomNavigationBarType.shifting, //seçienin yukarı ve ortaya yakınlastırıyor
            backgroundColor: Colors.pink[50],
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.pink),
                activeIcon: Icon(Icons.home, color: Colors.pink),
                label: '',
                tooltip: 'Ana Sayfa',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  // width: 100,
                  // buyutmek istiyorsan ac
                  child: Image.asset(
                    'assets/images/psikolook_logo.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height *
                        0.08, //bunu ayaralrsın tekrardan
                  ),
                ),
                label: '',
                tooltip: 'Psikolook',
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
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromRGBO(204, 11, 106, 100)),
      backgroundColor: Colors.transparent,
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

  Card buildDrawer() {
    return Card(
      color: Colors.amberAccent,
      shape: StadiumBorder(),
      child: Container(
        height: 250,
        margin: EdgeInsets.only(bottom: 30, top: 30, right: 30, left: 9),
        child: Drawer(
            elevation: 0,
            width: 91,
            backgroundColor: Colors.amberAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                  color: Colors.white,
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
                    'KVKK Hakkımızda',
                    style: TextStyle(
                      color: Colors.white,
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
                    'İletişim',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CikisYapPage()),
                    );
                  },
                  child: Text(
                    'Çıkış Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
