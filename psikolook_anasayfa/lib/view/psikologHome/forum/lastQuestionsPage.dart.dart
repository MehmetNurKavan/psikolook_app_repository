import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/newAnswer.dart.dart';
import 'package:psikolook_anasayfa/widget/bac_icon_button.dart';

class LastQuestionPage extends StatefulWidget {
  var snap;
  LastQuestionPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<LastQuestionPage> createState() => _LastQuestionPageState();
}

class _LastQuestionPageState extends State<LastQuestionPage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconButton2(),
                Column(
                  children: [
                    QuestionCard(snap: widget.snap, bools: false),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Cevaplar",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        AnsverButton(
                          func: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewAnswerPage(
                                        snap: widget.snap,
                                        isCaption: false)));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('questions')
                            .doc(widget.snap['questionId'])
                            .collection('comments')
                            .orderBy('datePublished', descending: true)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: circleLoading(),
                            );
                          }
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: (snapshot.data! as dynamic).docs.length,
                            itemBuilder: (context, index) {
                              return QuestionAnswerCard(
                                questionId: widget.snap['questionId'],
                                snap: snapshot.data!.docs[index].data(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
