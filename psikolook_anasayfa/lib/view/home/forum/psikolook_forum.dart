import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/forum/newCaption.dart';
import 'package:psikolook_anasayfa/view/home/forum/newQuestionPage.dart';
import 'package:psikolook_anasayfa/view/home/forum/questionsPage.dart';
import 'package:psikolook_anasayfa/view/home/forum/topicsPage.dart';
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
                              builder: (context) => NewQuestionPage(),
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
                              builder: (context) => newTopicPage(),
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
                                      const newCaptionPage()));
                        },
                        icon: const Icon(
                          Icons.question_answer,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
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
                buildPsikolookFormSection(height, width),
                SizedBox(
                  height: height * 0.02,
                ),
                buildPsikolookFormSection(height, width),
                SizedBox(
                  height: height * 0.02,
                ),
                buildPsikolookFormSection(height, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
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
                buildPsikolookFormQuestionSection(height, width),
                SizedBox(
                  height: height * 0.05,
                ),
                buildPsikolookFormQuestionSection(height, width),
                SizedBox(
                  height: height * 0.05,
                ),
                buildPsikolookFormQuestionSection(height, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
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
                buildTopics(width, height),
                SizedBox(
                  height: height * 0.05,
                ),
                buildTopics(width, height),
                SizedBox(
                  height: height * 0.05,
                ),
                buildTopics(width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTopics(var width, var height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Container(
              height: height * 0.10,
              width: width * 1,
              child: const Center(
                child: Text(
                  "KONU BAŞLIĞI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildPsikolookFormSection(var height, var width) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width * 0.5,
                      child: const Column(
                        children: [
                          Text(
                            "Ünvan İsim Soyisim",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Divider(thickness: 0.7, color: Colors.black),
                        ],
                      )),
                  const Text("Lorem Ipsum",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  const Divider(thickness: 0.7, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 36,
            child: CircleAvatar(
              radius: 32,
              foregroundImage: AssetImage(
                "assets/images/woman_blog.png",
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildPsikolookFormQuestionSection(var height, var width) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ListTile(
                  textColor: Colors.red,
                  title: Text(
                    "\nÜnvan İsim Soyisim\n \nLisans Bilgisi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  subtitle: Text(
                    "\nKonu",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  tileColor: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 36,
              child: CircleAvatar(
                radius: 32,
                foregroundImage: AssetImage(
                  "assets/images/woman_blog.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
