import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/customs/forumcustoms.dart';
import '../../../widget/bac_icon_button.dart';

class NewAnswerPage extends StatefulWidget {
  var snap;
  bool isCaption;
  NewAnswerPage({Key? key, required this.snap, required this.isCaption})
      : super(key: key);

  @override
  State<NewAnswerPage> createState() => _NewAnswerPageState();
}

class _NewAnswerPageState extends State<NewAnswerPage> {
  TextEditingController _answerController = TextEditingController();
  bool isLoading = false;
  String idValue = "";

  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void comment(String uid, String username, String photoUrl) async {
    try {
      if (_answerController.text != "") {
        if (widget.isCaption == true) {
          String res = await FireStoreMethods().captionComment(
            widget.snap['captionId'].toString(),
            _answerController.text,
            uid,
            username,
            photoUrl,
          );
          if (res == 'success') {
            showSnackBar(context, 'Paylaşıldı');
            Navigator.of(context).pop();
          } else {
            showSnackBar(context, res);
          }
        } else {
          String res = await FireStoreMethods().questionComment(
            widget.snap['questionId'].toString(),
            _answerController.text,
            uid,
            username,
            photoUrl,
          );
          if (res == 'success') {
            showSnackBar(context, 'Paylaşıldı');
            Navigator.of(context).pop();
          } else {
            showSnackBar(context, res);
          }
        }
      } else {
        showSnackBar(context, 'Lütfen tüm değerleri giriniz');
        unfocus();
      }
      setState(() {
        _answerController.text = "";
      });
    } catch (err) {
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
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          BackIconButton2(),
                        ],
                      ),
                      Center(
                        child: Text(
                          "Yeni Cevap",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 34,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      buildNewAnswerCard(width),
                      AddButton(
                        func: () {
                          comment(
                            userData['uid'] ?? '',
                            userData['username'] ?? '',
                            userData['photoUrl'] ?? '',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildNewAnswerCard(double width) {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData['username'].toString(),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.7, color: greyColor),
                        ],
                      )),
                  SizedBox(
                      width: width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.snap['topicText'].toString(),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.7, color: greyColor),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                    child: TextFormField(
                      controller: _answerController,
                      maxLength: 200,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Cevabınızı Yazınız...",
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 36,
            child: CircleAvatar(
                radius: 32,
                foregroundImage: NetworkImage(userData['photoUrl'].toString())),
          ),
        ),
      ],
    );
  }
}
