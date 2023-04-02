import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/blog/blog_share.dart';
import 'package:psikolook_anasayfa/widget/my_blog_card.dart';

class MyBlogsPage extends StatefulWidget {
  final String uid;
  const MyBlogsPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<MyBlogsPage> createState() => _MyBlogsPageState();
}

class _MyBlogsPageState extends State<MyBlogsPage> {

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor,
          ),
        ),
        child: RefreshIndicator(
        /* LiquidPullToRefresh( */
          onRefresh: _handleRefresh,
          color: Colors.black,
          backgroundColor: Colors.white,
          child: ListView(
            primary: false,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 15),
                    barField(),
                    hearthIcon(),
                    startWriteText("Yazmaya Başla ve Kalplere Dokun"),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView(
                  children: [
                    FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('blogs')
                          .where('uid', isEqualTo: widget.uid)
                          .get(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
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
                              return MyBlogCard(
                                snap: snapshot.data!.docs[index].data(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//close icon'u ve text kısmını içeriyor...
  Row barField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "Blog Yazısı Yaz",
          style: TextStyle(color: Colors.black87, fontSize: 27),
        ),
        closeIconButton(),
      ],
    );
  }

  Widget startWriteText(String elevatedbuttonText) {
    return Text(elevatedbuttonText,
        style: const TextStyle(
            fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w400));
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
              MaterialPageRoute(builder: (context) => const BlogShare()));
        },
        icon: Image.asset('assets/images/heart.png'),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 45),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 30,
      ),
    );
  }
}
