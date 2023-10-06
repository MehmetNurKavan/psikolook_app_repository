import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import '../../../widget/bac_icon_button.dart';

class CaptionsPage extends StatefulWidget {
  const CaptionsPage({Key? key}) : super(key: key);

  @override
  State<CaptionsPage> createState() => _CaptionsPageState();
}

class _CaptionsPageState extends State<CaptionsPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                SizedBox(height: height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "BAŞLIKLAR",
                    style: GoogleFonts.montserrat(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('captions')
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
                          return CaptionCard(
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
