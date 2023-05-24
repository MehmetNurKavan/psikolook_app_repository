import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:psikolook_anasayfa/adminpanel/admin_panel.dart';
import 'package:psikolook_anasayfa/adminpanel/admin_profil.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/home/home_page/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';
import 'package:psikolook_anasayfa/view/home/topluluk/toplulukPage.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';

class AdminPsikolookIcon extends StatefulWidget {
  final String uid;
  const AdminPsikolookIcon({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdminPsikolookIcon> createState() => _AdminPsikolookIconState();
}

class _AdminPsikolookIconState extends State<AdminPsikolookIcon> {
  bool isVisible = true;
  bool isNotVisible = false;

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('posts')
                          .orderBy("datePublished", descending: true)
                          .startAt([DateTime.now()]).snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) => SizedBox(
                            /* margin: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width > 600
                                  ? MediaQuery.of(context).size.width * 0.3
                                  : 0,
                              vertical: MediaQuery.of(context).size.width > 600
                                  ? 15
                                  : 0,
                            ), */
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: PostCard(
                              snap: snapshot.data!.docs[index].data(),
                            ),
                          ),
                        );
                      },
                    ),
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
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 6,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('blogs')
                        .orderBy("datePublished", descending: true)
                        .startAt([DateTime.now()]).snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 1.5,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          /* DocumentSnapshot snap =
                            (snapshot.data! as dynamic).docs[index]; */
                          //!
                          return BlogCard(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isNotVisible,
              child: Expanded(
                flex: 9,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('blogs')
                        .orderBy("datePublished", descending: true)
                        .startAt([DateTime.now()]).snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return BlogCard(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                      );
                    },
                  ),
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

Card buildBlogCardView(dkk, baslik, image) {
  return Card(
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
  );
}

Card buildMidCardView(context, psikologAvatar, history, otherPsikologName) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
            width: 0.4, color: Color.fromARGB(255, 201, 201, 201))),
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
      onPressed: () {},
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
                  MaterialPageRoute(builder: (context) => const AdminPanel()));
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
                      builder: (context) => AdminProfil(
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
