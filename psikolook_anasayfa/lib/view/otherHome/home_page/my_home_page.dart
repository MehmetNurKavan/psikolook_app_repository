import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/partner/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/partner/message/message_page.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/otherHome/psikolook/psikolook_page.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/toplulukPage.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';
import 'package:psikolook_anasayfa/widget/blog_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/meet_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/next_meet_card_other.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/widget/post_card_skelton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  bool isNotVisible = false;
  String psikologName = 'Henüz Psikologun Yok';
  String psikologText =
      'Sana uygun psikologu bulman için aşağıdaki Psikolook logosuna bas';
  String psikologImage = 'assets/images/default-usr.png';

  final int postBatchSize = 4;
  final ScrollController _postScrollController = ScrollController();
  List<DocumentSnapshot> _postData = [];
  bool _isPostLoading = false;
  bool _hasMorePost = true;
  bool __isLoadingPost = false;
  final int blogBatchSize = 4;
  final ScrollController _blogScrollController = ScrollController();
  List<DocumentSnapshot> _blogData = [];
  bool _isBlogLoading = false;
  bool _hasMoreBlog = true;
  bool __isLoadingBlog = false;
  final int blogBatchSize2 = 9;
  final ScrollController _blogScrollController2 = ScrollController();
  List<DocumentSnapshot> _blogData2 = [];
  bool _isBlogLoading2 = false;
  bool _hasMoreBlog2 = true;
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
      backgroundColor: backGroundColor[backGroundColor.length - 1],
      appBar: buildAppBar(context),
      drawer: const buildDrawerWidget(),
      bottomNavigationBar: buildButtonNavigatorBar(context),
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
              colors: backGroundColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: isVisible,
              child: Expanded(
                flex: 3,
                child: SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('dateAvailable')
                        .where('otherUid',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .where('isVisible', isEqualTo: false)
                        .where('datePublished',
                                isGreaterThanOrEqualTo: DateTime.now())
                        .limit(1)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: MeetCardSkelton(),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.docs.isNotEmpty) {
                        return NextMeetCardOther(
                              snap: snapshot.data!.docs[0].data()
                        );
                      } else {
                        return buildMeetingCardView(
                            context, psikologName, psikologText, psikologImage);
                      }
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
                      ? const Center(child: Padding(
                        padding: EdgeInsets.only(top:10.0),
                        child: PostCardSkelton(),
                      ))
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
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _blogScrollController,
                        itemCount: _blogData.length + (_hasMoreBlog ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _blogData.length) {
                            return _isBlogLoading
                                ? Center(child: circleLoading())
                                : Container();
                          }
                          final document = _blogData[index];
                          return SizedBox(
                              width: 150, child: BlogCard(snap: document));
                        },
                      ),
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
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

Widget buildMeetingCardView(
    context, psikologName, psikologText, psikologImage) {
  return Card(
    elevation: 0,
    color: cardBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(
          width: 0.4, color: greyColor),
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
                  colors: pinkColors
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(psikologImage),
                radius: 35.0,
                backgroundColor: Colors.transparent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      psikologText,
                      style: const TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 5),
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
                      onPressed: () {
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
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Image.asset('assets/images/home_icon.png'),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BilimeKatkiPage()));
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
                      builder: (context) => HomePagePerson(
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
