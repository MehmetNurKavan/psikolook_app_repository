import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/newCaption.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/newQuestionPage.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/questionsPage.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/topicsPage.dart';
import '../../../widget/bac_icon_button.dart';
import 'captionsPage.dart.dart';
import 'customs/forumcustoms.dart';
import 'newtopicspage.dart';

class PsikolookformPage extends StatelessWidget {
  const PsikolookformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/backgroun1.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: PaddingCustom(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackIconButton2(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      width: 220,
                      child: Center(
                        child: Text(
                          "PSİKOLOOK FORUM",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewQuestionPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.question_circle_fill,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewTopicPage(),
                            ),
                          );
                        },
                        icon: Image.asset(
                          "assets/images/forum_icon.png",
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NewCaptionPage()));
                        },
                        icon: const Icon(
                          Icons.question_answer,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaptionsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Son Eklenen Başlıklar",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('captions')
                        .orderBy('datePublished', descending: true)
                        .limit(3)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: circleLoading(),
                        );
                      }
                      return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return CaptionCard(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: width * 0.01),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Son Eklenen Sorular",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('questions')
                        .orderBy('datePublished', descending: true)
                        .limit(3)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: circleLoading(),
                        );
                      }
                      return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return QuestionCard(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: width * 0.01),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopicsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "KONULAR",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('topics')
                        .orderBy('datePublished', descending: true)
                        .limit(3)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: circleLoading(),
                        );
                      }
                      return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return TopicCard(
                            snap: snapshot.data!.docs[index].data(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
