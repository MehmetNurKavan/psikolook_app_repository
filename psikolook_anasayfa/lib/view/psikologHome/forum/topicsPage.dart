import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import '../../../widget/bac_icon_button.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({Key? key}) : super(key: key);

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
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.search_circle_fill,
                          size: 50,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "KONULAR",
                    style: GoogleFonts.montserrat(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('topics')
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

  buildSectionName(String sectionName, var width, context, var routee) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.01,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routee));
          },
          child: Text(
            sectionName,
            style: GoogleFonts.montserrat(
                color: Colors.black,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
