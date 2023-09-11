import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/post_share.dart';
import 'package:psikolook_anasayfa/widget/post_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/skeleton.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';

class MyPostsPage extends StatefulWidget {
  final String uid;
  const MyPostsPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            barField(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('posts')
                    .where('uid', isEqualTo: widget.uid)
                    .orderBy("datePublished", descending: true)
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: PostCardSkelton(),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    return SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: PostCard(
                            snap: snapshot.data!.docs[index].data(),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return shareCard();
                  }
                },
              ),
            ),
            hearthIcon(),
          ],
        ),
      ),
    );
  }

//close icon içeriyor
  Widget barField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        closeIconButton(),
      ],
    );
  }

  Widget shareCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(39)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 10.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/psikolook_logo.png'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Psikolook",
                        style: textStyle.userNameTextStyle,
                      ),
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "Henüz hiç paylaşımın yok,\n\nhadi paylaşım yaparak kalplere dokun",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container hearthIcon() {
    return Container(
      height: 71,
      width: 71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5), color: Colors.white),
      child: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PostShare()));
        },
        icon: Image.asset('assets/images/heart.png'),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 35,
      ),
    );
  }
}

