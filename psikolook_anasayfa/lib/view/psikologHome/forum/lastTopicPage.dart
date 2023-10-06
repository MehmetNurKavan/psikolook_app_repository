import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import 'package:psikolook_anasayfa/widget/bac_icon_button.dart';

class LastTopicPage extends StatelessWidget {
  var snap;
  LastTopicPage({Key? key, required this.snap}) : super(key: key);

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
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                                  snap['topicText'],
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
                ),
                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('captions')
                        .where('topicText', isEqualTo: snap['topicText'])
                        .orderBy('datePublished', descending: false)
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
}
