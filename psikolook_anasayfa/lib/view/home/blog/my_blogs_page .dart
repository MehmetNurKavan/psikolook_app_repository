import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/blog/blog_share.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';

class MyBlogsPage extends StatefulWidget {
  final String uid;
  const MyBlogsPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<MyBlogsPage> createState() => _MyBlogsPageState();
}

class _MyBlogsPageState extends State<MyBlogsPage> {
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
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            children: [
              const SizedBox(height: 81.7),
              Column(
                children: [
                  barField(),
                  const SizedBox(height: 75),
                  hearthIcon(),
                  const SizedBox(height: 23.5),
                  startWriteElevatedButton("!Yazmaya Başla"),
                  const SizedBox(height: 23.5),
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('blogs')
                        .where('uid', isEqualTo: widget.uid)
                        .get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
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
                ],
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
        const Text("Blog Yazısı Yaz",
            style: TextStyle(color: Colors.black87, fontSize: 27),
            ),closeIconButton(),
      ],
    );
  }

  Center startWriteElevatedButton(String elevatedbuttonText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29.0),
        child: SizedBox(
            height: 70,
            width: 356,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BlogShare()));
                  },
                  icon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 29),
                    child: Icon(
                      Icons.more_horiz,
                      color: Color(0x73000000),
                      size: 35,
                    ),
                  ),
                  label: Text(elevatedbuttonText,
                      style:const TextStyle(fontSize: 22,color: Colors.black87,fontWeight: FontWeight.w400)),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.customElevatedButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))),
            )),
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
        onPressed: () {},
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
