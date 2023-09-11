import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:psikolook_anasayfa/view/adminHome/admin_panel.dart';
import 'package:psikolook_anasayfa/view/adminHome/admin_profil.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/partner/message/message_page.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/toplulukPage.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_share.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';
import 'package:psikolook_anasayfa/widget/blog_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';
import 'package:psikolook_anasayfa/widget/post_card_skelton.dart';

class AdminPsikolookIcon extends StatefulWidget {
  final String uid;
  const AdminPsikolookIcon({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdminPsikolookIcon> createState() => _AdminPsikolookIconState();
}

class _AdminPsikolookIconState extends State<AdminPsikolookIcon> {
  bool isVisible = true;
  bool isNotVisible = false;
  final int postBatchSize = 4;
  final ScrollController _postScrollController = ScrollController();
  final List<DocumentSnapshot> _postData = [];
  bool _isPostLoading = false;
  bool _hasMorePost = true;
  bool __isLoadingPost = false;
  final int blogBatchSize = 6;
  final ScrollController _blogScrollController = ScrollController();
  final List<DocumentSnapshot> _blogData = [];
  bool _isBlogLoading = false;
  bool _hasMoreBlog = true;
  bool __isLoadingBlog = false;
  final int blogBatchSize2 = 9;
  final ScrollController _blogScrollController2 = ScrollController();
  final List<DocumentSnapshot> _blogData2 = [];
  bool _isBlogLoading2 = false;
  final bool _hasMoreBlog2 = true;
  bool __isLoadingBlog2 = false;

  @override
  void initState() {
    super.initState();
    _postGetData();
    _postScrollController.addListener(() {
      if (_postScrollController.position.pixels ==
          _postScrollController.position.maxScrollExtent) {
        _postGetData();
      }
    });
    _blogGetData();
    _blogScrollController.addListener(() {
      if (_blogScrollController.position.pixels ==
          _blogScrollController.position.maxScrollExtent) {
        _blogGetData();
      }
    });
    _blogGetData2();
    _blogScrollController2.addListener(() {
      if (_blogScrollController2.position.pixels ==
          _blogScrollController2.position.maxScrollExtent) {
        _blogGetData2();
      }
    });
  }

  Future<void> _postGetData() async {
    if (_isPostLoading || !_hasMorePost) return;

    QuerySnapshot querySnapshot;
    if (_postData.isEmpty) {
      setState(() {
        __isLoadingPost = true;
      });

      querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy("datePublished", descending: true)
          .limit(postBatchSize)
          .get();
    } else {
      setState(() {
        _isPostLoading = true;
      });
      querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy("datePublished", descending: true)
          .startAfterDocument(_postData.last)
          .limit(postBatchSize)
          .get();
    }

    if (querySnapshot.docs.length < postBatchSize) {
      _hasMorePost = false;
    }

    setState(() {
      _isPostLoading = false;
      __isLoadingPost = false;
      _postData.addAll(querySnapshot.docs);
    });
  }

  Future<void> _blogGetData() async {
    if (_isBlogLoading || !_hasMoreBlog) return;
    QuerySnapshot querySnapshot;
    if (_blogData.isEmpty) {
      setState(() {
        __isLoadingBlog = true;
      });
      querySnapshot = await FirebaseFirestore.instance
          .collection('blogs')
          .orderBy("datePublished", descending: true)
          .limit(blogBatchSize)
          .get();
    } else {
      setState(() {
        _isBlogLoading = true;
      });
      querySnapshot = await FirebaseFirestore.instance
          .collection('blogs')
          .orderBy("datePublished", descending: true)
          .startAfterDocument(_blogData.last)
          .limit(blogBatchSize)
          .get();
    }

    if (querySnapshot.docs.length < blogBatchSize) {
      _hasMoreBlog = false;
    }

    setState(() {
      _isBlogLoading = false;
      __isLoadingBlog = false;
      _blogData.addAll(querySnapshot.docs);
    });
  }

  Future<void> _blogGetData2() async {
    if (_isBlogLoading2 || !_hasMoreBlog2) return;
    QuerySnapshot querySnapshot;
    if (_blogData2.isEmpty) {
      setState(() {
        __isLoadingBlog2 = true;
      });
      querySnapshot = await FirebaseFirestore.instance
          .collection('blogs')
          .orderBy("datePublished", descending: true)
          .limit(blogBatchSize2)
          .get();
    } else {
      setState(() {
        _isBlogLoading = true;
      });
      querySnapshot = await FirebaseFirestore.instance
          .collection('blogs')
          .orderBy("datePublished", descending: true)
          .startAfterDocument(_blogData2.last)
          .limit(blogBatchSize2)
          .get();
    }

    if (querySnapshot.docs.length < blogBatchSize2) {
      _hasMoreBlog = false;
    }

    setState(() {
      _isBlogLoading2 = false;
      __isLoadingBlog2 = false;
      _blogData2.addAll(querySnapshot.docs);
    });
  }

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
                flex: 3,
                child: buildTopCardView(context),
              ),
            ),
            Visibility(
                visible: isNotVisible, child: const SizedBox(height: 20.0)),
            Visibility(
              visible: isNotVisible,
              child: Expanded(
                flex: 9,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    controller: _blogScrollController2,
                    itemCount: _blogData2.length + (_hasMoreBlog2 ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _blogData2.length) {
                        return _isBlogLoading2
                            ? Center(child: circleLoading())
                            : Container();
                      }
                      final document = _blogData2[index];
                      return BlogCard(snap: document);
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: __isLoadingPost
                      ? const Center(child: PostCardSkelton())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _postScrollController,
                          itemCount: _postData.length + (_hasMorePost ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == _postData.length) {
                              return _isPostLoading
                                  ? Center(child: circleLoading())
                                  : Container();
                            }
                            final document = _postData[index];
                            return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: PostCard(snap: document));
                          },
                        ),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
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
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 3,
                child: __isLoadingBlog
                    ? const Center(child: BlogCardSkelton())
                    : GridView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                        controller: _blogScrollController,
                        itemCount: _blogData.length + (_hasMoreBlog ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _blogData.length) {
                            return _isBlogLoading
                                ? Center(child: circleLoading())
                                : Container();
                          }
                          final document = _blogData[index];
                          return BlogCard(snap: document);
                        },
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

Widget buildTopCardView(context) {
  return Card(
    elevation: 0,
    color: cardBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(width: 0.4, color: greyColor),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    colors: pinkColors),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Text(
                    'Psikolook',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/dflt-user.png'),
                radius: 35.0,
                backgroundColor: Colors.transparent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.6),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: blueButtonColors,
                      ),
                    ),
                    width: 200,
                    child: TextButton(
                      child: const Text('Görüşme Linki',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                      onPressed: () {},
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
