import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/drawer_widget.dart';
import 'package:psikolook_anasayfa/view/partner/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/partner/message/message_page.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_share.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologprofil/psikolog_profil.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/toplulukPage.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';
import 'package:psikolook_anasayfa/widget/blog_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/meet_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/next_meet_card.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';
import 'package:intl/intl.dart';

class PsikologPsikolookIcon extends StatefulWidget {
  final String uid;
  const PsikologPsikolookIcon({Key? key, required this.uid}) : super(key: key);

  @override
  State<PsikologPsikolookIcon> createState() => _PsikologPsikolookIconState();
}

class _PsikologPsikolookIconState extends State<PsikologPsikolookIcon> {
  bool isVisible = true;
  bool isNotVisible = false;

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
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('dateAvailable')
                      .where('uid',
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
                      return NextMeetCard(snap: snapshot.data!.docs[0].data());
                    } else {
                      return buildTopCardView(context);
                    }
                  },
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
                      ? const Center(child: BlogCardSkelton())
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
                    ? Center(child: circleLoading())
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

Card buildTopCardView(context) {
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
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    colors: pinkColors),
              ),
              child: const Center(
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/default-usr.png'),
                  radius: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'Görünüşe göre yakınlarda ayarlanılmış bir seansınız bulunmamaktadır',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
