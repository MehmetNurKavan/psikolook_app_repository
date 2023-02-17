import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:psikolook_anasayfa/view/home/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/home/home_page/blog_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/meeting_page.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
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

  String mavi = 'Color.fromARGB(255, 92, 225, 230),';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 222, 228),
      appBar: buildAppBar(context),
      drawer: const buildDrawerWidget(),
      bottomNavigationBar: buildButtonNavigatorBar(context),
      floatingActionButton: buildPsikolookButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              //Color.fromARGB(255, 255, 204, 204),
              Color.fromARGB(255, 248, 230, 228),
              Color.fromARGB(255, 250, 234, 240),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 219, 233, 234),
              Color.fromARGB(255, 192, 222, 228),
            ],
          ),
        ),
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
                      buildBlogCardView(context, dkk1, baslik1, image1),
                      buildBlogCardView(context, dkk2, baslik2, image2),
                      buildBlogCardView(context, dkk3, baslik3, image3),
                      buildBlogCardView(context, dkk4, baslik4, image4),
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
                    childAspectRatio: 2 / 3,
                    children: [
                      buildMidCardView(
                          context, psikologAvatar, history, otherPsikologName),
                      buildMidCardView(
                          context, psikologAvatar, history, otherPsikologName),
                      buildMidCardView(
                          context, psikologAvatar, history, otherPsikologName),
                      buildMidCardView(
                          context, psikologAvatar, history, otherPsikologName),
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
                      buildBlogCardView(context, dkk1, baslik1, image1),
                      buildBlogCardView(context, dkk2, baslik2, image2),
                      buildBlogCardView(context, dkk3, baslik3, image3),
                      buildBlogCardView(context, dkk4, baslik4, image4),
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
                          color: Color.fromARGB(255, 147, 182, 213),
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
                    buildBlogCardView(context, dkk1, baslik1, image1),
                    buildBlogCardView(context, dkk2, baslik2, image2),
                    buildBlogCardView(context, dkk3, baslik3, image3),
                    buildBlogCardView(context, dkk4, baslik4, image4),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

Card buildMeetingCardView(context, psikologName, psikologText, psikologImage) {
  return Card(
    elevation: 0,
    color: const Color.fromARGB(255, 251, 249, 249),
    shape: RoundedRectangleBorder(
      
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(
          width: 1.5, color: Color.fromARGB(255, 201, 201, 201)),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/infinity_half_big.png',
          ),
          fit: BoxFit.fitWidth,
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
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width * 0.9,
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
                  child: Center(
                    child: Text(
                      psikologName,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.08),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CircleAvatar(
                    backgroundImage: AssetImage(psikologImage),
                    radius: 35.0,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.075),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      psikologText,
                      style: const TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        //tileMode: TileMode.decal,
                        colors: [
                          Color.fromARGB(255, 221, 240, 242),
                          Color.fromARGB(255, 191, 222, 228),
                          Color.fromARGB(255, 164, 206, 215),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextButton(
                      child: const Text('Görüşme Linki',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
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
            ],
          ),
        ],
      ),
    ),
  );
}

InkWell buildBlogCardView(context, dkk, baslik, image) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlogPage(),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        //width: 165, //bunun sayesinde sabitledik mükk oldu
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: AssetImage(image),
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
                    style: const TextStyle(
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
                    style: const TextStyle(
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
    ),
  );
}

Card buildMidCardView(context, psikologAvatar, history, otherPsikologName) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
            width: 1.5, color: Color.fromARGB(255, 201, 201, 201))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          //height: MediaQuery.of(context).size.height * 0.07,
          child: ListTile(
            //minLeadingWidth: 1,aralarınadki bosluk sanırım
            contentPadding: const EdgeInsets.all(1),
            //horizontalTitleGap: 3.0, //başlık ve avatar arasındaki mesafe olamlı
            //minVerticalPadding: 10,
            //minLeadingWidth: 10,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(psikologAvatar),
              ),
            ),
            title: Text(otherPsikologName),
            subtitle: Text(history),
            //isThreeLine: true, //alanını genisletiyor,yerlestiriyor
            //dense: true, //alanını daraltiyor gibi
            trailing:
                const Icon(Icons.keyboard_arrow_down, color: Colors.black38),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: const SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('Henüz takip ettiğiniz psikolog yok.',
                style: TextStyle(fontWeight: FontWeight.w300)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                onPressed: share,
                icon: Icon(Icons.share_outlined),
              ),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
              const Text('143'),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline,
                      color: Color.fromARGB(255, 174, 220, 225))),
              const Text('942'),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/infinity_add_icon.png')),
            ],
          ),
        ),
      ],
    ),
  );
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'Psikolook paylaş',
      text: 'Psikolook',
      linkUrl: 'https://flutter.dev/', //burası backende giriyor
      chooserTitle: 'Paylaş');
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
              builder: (context) => const PsikolookPage(),
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const homePage()));
            },
            icon: Image.asset('assets/images/home_icon.png'),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CokYakindaPage()));
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage_Person()));
            },
            icon: Image.asset('assets/images/person_icon.png'),
            iconSize: 40,
          ),
        ],
      ),
    ),
  );
}
