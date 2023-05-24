import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/adminpanel/update_admin_profil.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/blog/my_posts_page.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/widget/my_post_card.dart';

class AdminProfil extends StatefulWidget {
  final String uid;
  const AdminProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdminProfil> createState() => _AdminProfilState();
}

class _AdminProfilState extends State<AdminProfil> {

  var userData = {};
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(widget.uid)
          .get();

      // get blog lENGTH
      var blogSnap = await FirebaseFirestore.instance
          .collection('blogs')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      blogLen = blogSnap.docs.length;
      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  _bioField() {
    if (userData['bio'].toString() != '' &&
        userData['bio'].toString() != 'null') {
      return userData['bio'];
    } else {
      return 'Lütfen düzenleye tıklayıp biyografinizi yazınız!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Colors.white,
                                        size: 30)),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                    userData['photoUrl'],
                                  ),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.15,
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        userData['username'].toString(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side: const BorderSide(
                                                color: Colors.white,
                                                width: 1.5),
                                          ))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateAdminProfil(
                                                        uid: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            left: 10,
                                            right: 10,
                                            bottom: 5),
                                        child: Text(
                                          "Düzenle",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '$followers',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'TAKİPÇİLER',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$postLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'PAYLAŞIMLAR',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$blogLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'BLOG YAZILARI',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              color: Colors.white54,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.05,
                              thickness: 0.9,
                              indent: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 50.0,top: 20.0),
                            child: Column(
                              children: [
                                const Text('Biyografiniz:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(_bioField().toString(),
                                      textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 275,
                          child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('posts')
                                .where('uid', isEqualTo: widget.uid)
                                .get(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: NewsCardSkelton(),
                                );
                              } else if (snapshot.hasData != null) {
                                return SizedBox(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (ctx, index) => SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: MyPostCard(
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Container shareCard() {
    return Container(
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(39)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.person,
                    color: CustomColors.hearthColor, size: 34),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: const [
                    Text(
                      "Psikolook",
                    ),
                    Text(
                      "1 hours ago",
                    )
                  ],
                ),
                const SizedBox(width: 120),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_sharp))
              ],
            ),
          ),
          const Text(
            "Henüz hiç paylaşımın yok,\nhadi paylaşım yaparak kalplere dokun",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
