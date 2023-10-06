import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import '../../../widget/bac_icon_button.dart';
import 'customs/forumcustoms.dart';

class NewTopicPage extends StatefulWidget {
  const NewTopicPage({Key? key}) : super(key: key);

  @override
  State<NewTopicPage> createState() => _NewTopicPageState();
}

class _NewTopicPageState extends State<NewTopicPage> {
  bool isLoading = false;
  final TextEditingController _topicTextController = TextEditingController();

  void shareTopic(
    String uid,
    String username,
    String photoUrl,
  ) async {
    setState(() {
      isLoading = true;
      showLoaderDialog(context);
    });
    // start the loading
    try {
      // upload to storage and db
      if (_topicTextController.text != "") {
        String res = await FireStoreMethods().uploadTopic(
          uid,
          username,
          photoUrl,
          _topicTextController.text,
        );
        if (res == "success") {
          setState(() {
            isLoading = false;
            Navigator.of(context).pop(context);
          });
          showSnackBar(
            context,
            'Paylaşıldı!!',
          );
          Navigator.pop(context);
        } else {
          Navigator.of(context).pop(context);
          showSnackBar(context, res);
        }
      } else {
        Navigator.of(context).pop(context);
        showSnackBar(context, "Lütfen tüm seçenekleri doldurunuz");
      }
    } catch (err) {
      setState(() {
        isLoading = false;
        Navigator.of(context).pop(context);
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  var userData = {};

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = userSnap.data()!;
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

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _topicTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroun1.png"),
                fit: BoxFit.fill)),
        child: isLoading
            ? Center(
                child: circleLoading(),
              )
            : SingleChildScrollView(
                child: PaddingCustom(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BackIconButton2(),
                          Image(
                            width: 50,
                            color: Colors.black,
                            image: AssetImage(
                              "assets/images/forum_icon.png",
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Center(
                        child: Text(
                          "Yeni Konu",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 34,
                            ),
                          ),
                        ),
                      ),
                      newTopicWidget(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Center(
                          child: AddButton(
                            func: () {
                              shareTopic(
                                userData['uid'],
                                userData['username'],
                                userData['photoUrl'],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget newTopicWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 75.0),
      child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35.0),
              bottomLeft: Radius.circular(35.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 15.0, bottom: 8.0),
            child: TextFormField(
              controller: _topicTextController,
              maxLength: 50,
              maxLines: null,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Yeni Konu Oluştur",
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
