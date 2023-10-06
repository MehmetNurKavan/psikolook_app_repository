import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import '../../../widget/bac_icon_button.dart';
import 'customs/forumcustoms.dart';

class NewCaptionPage extends StatefulWidget {
  const NewCaptionPage({Key? key}) : super(key: key);

  @override
  State<NewCaptionPage> createState() => _NewCaptionPageState();
}

class _NewCaptionPageState extends State<NewCaptionPage> {
  bool isLoading = false;
  final TextEditingController _captionTextController = TextEditingController();
  String topic = "Konu Seç";

  void shareCaption(
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
      if (topic != 'Konu Seç' &&
          topic != "" &&
          _captionTextController.text != "") {
        String res = await FireStoreMethods().uploadCaption(
            uid, username, photoUrl, _captionTextController.text, topic);
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
        showSnackBar(context, 'Lütfen tüm seçenekleri doldurunuz');
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

  List<String> topicTexts = [];
  getTopicData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var topicSnap =
          await FirebaseFirestore.instance.collection('topics').get();
      topicTexts = topicSnap.docs
          .map((doc) => doc.data()['topicText'].toString())
          .toList();
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
    getTopicData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _captionTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BackIconButton2(),
                          Icon(
                            Icons.question_answer,
                            size: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Center(
                        child: Text(
                          "Yeni Başlık",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 34,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      buildNewCaptionWidget(width),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AddButton(
                          func: () {
                            shareCaption(
                              userData['uid'],
                              userData['username'],
                              userData['photoUrl'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildNewCaptionWidget(var width) {
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
                            userData['username'],
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
                          DecoratedBox(
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(),
                            ),
                            child: DropdownButton(
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
                              icon: const SizedBox(),
                              isExpanded: true,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 16),
                              items: topicTexts.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  topic = newValue!;
                                });
                              },
                              hint: Text(topic,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16)),
                              underline: const SizedBox(),
                            ),
                          ),
                          const Divider(thickness: 0.7, color: greyColor),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                    child: TextFormField(
                      controller: _captionTextController,
                      maxLength: 200,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Yeni Başlık Oluştur",
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
            radius: 32,
            child: CircleAvatar(
              radius: 28,
              foregroundImage: NetworkImage(userData['photoUrl']),
            ),
          ),
        ),
      ],
    );
  }
}
