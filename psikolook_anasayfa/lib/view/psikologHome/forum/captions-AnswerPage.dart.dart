import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/newAnswer.dart.dart';
import '../../../widget/bac_icon_button.dart';

class CaptionAnswerPage extends StatefulWidget {
  var snap;
  CaptionAnswerPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<CaptionAnswerPage> createState() => _CaptionAnswerPageState();
}

class _CaptionAnswerPageState extends State<CaptionAnswerPage> {

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
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                widget.snap['topicText'],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            const Divider(thickness: 0.7, color: greyColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CaptionCard(snap: widget.snap, bools: false),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 15, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  builder: (context) => NewAnswerPage(snap: widget.snap, isCaption: true)));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('captions')
                        .doc(widget.snap['captionId'])
                        .collection('comments')
                        .orderBy('datePublished', descending: true)
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
                          return CaptionAnswerCard(
                            captionId: widget.snap['captionId'],
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
