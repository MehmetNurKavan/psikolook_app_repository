import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/captions-AnswerPage.dart.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/lastQuestionsPage.dart.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/lastTopicPage.dart';

class PaddingCustom extends StatelessWidget {
  Widget child;
  PaddingCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5.0, right: 20.0, left: 20.0, bottom: 25.0),
        child: child,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final Function()? func;
  const AddButton({Key? key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.only(
                right: 40.0, left: 40.0, top: 7.5, bottom: 7.5),
            backgroundColor: Colors.black),
        onPressed: func,
        child: const Text(
          "EKLE",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class CustomForumCard extends StatelessWidget {
  //kodlara bunu çekmedik, ayrı oalarak aynısından kullandık ogeretici olarak burda sadece
  const CustomForumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(padding: EdgeInsets.all(15.0)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              radius: 28,
              foregroundImage: AssetImage(
                "assets/images/woman_blog.png",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CaptionCard extends StatelessWidget {
  var snap;
  bool bools;
  CaptionCard({Key? key, this.bools = true, required this.snap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        bools
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaptionAnswerPage(snap: snap),
                ),
              )
            : null;
      },
      child: Stack(
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
                          children: [
                            Text(
                              snap['username'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const Divider(thickness: 0.7, color: greyColor),
                          ],
                        )),
                    Text(snap['captionText'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    const Divider(thickness: 0.7, color: greyColor),
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
                  radius: 28, foregroundImage: NetworkImage(snap['photoUrl'])),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  var snap;
  bool bools;
  QuestionCard({Key? key, this.bools = true, required this.snap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        bools
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LastQuestionPage(snap: snap),
                ),
              )
            : null;
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width * 0.5,
                        child: Column(
                          children: [
                            Text(
                              snap['username'],
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
                              snap['topicText'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const Divider(thickness: 0.7, color: greyColor),
                          ],
                        )),
                    Text(snap['questionText'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: null,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    const Divider(thickness: 0.7, color: greyColor),
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
                  radius: 28, foregroundImage: NetworkImage(snap['photoUrl'])),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  var snap;
  TopicCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LastTopicPage(snap: snap)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
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
    );
  }
}

class CaptionAnswerCard extends StatefulWidget {
  var snap;
  String captionId;
  CaptionAnswerCard({Key? key, required this.captionId, required this.snap})
      : super(key: key);

  @override
  State<CaptionAnswerCard> createState() => _CaptionAnswerCardState();
}

class _CaptionAnswerCardState extends State<CaptionAnswerCard> {
  void deleteComment(String captionId, String commentId) async {
    try {
      await FireStoreMethods().deleteCaptionComment(captionId, commentId);
      showSnackBar(context, 'Yorum Kaldırıldı!');
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: width * 0.5,
                      child: Column(
                        children: [
                          Text(
                            widget.snap['username'],
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.7, color: greyColor),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.snap['text'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16)),
                    ],
                  ),
                  const Divider(thickness: 0.7, color: greyColor),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                    radius: 28,
                    foregroundImage: NetworkImage(widget.snap['photoUrl'])),
              ),
              widget.snap['id'] == FirebaseAuth.instance.currentUser!.uid
                  ? IconButton(
                      onPressed: () {
                        deleteComment(
                            widget.captionId, widget.snap['commentId']);
                      },
                      icon: const Icon(Icons.close))
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

class QuestionAnswerCard extends StatefulWidget {
  var snap;
  String questionId;
  QuestionAnswerCard({Key? key, required this.questionId, required this.snap})
      : super(key: key);

  @override
  State<QuestionAnswerCard> createState() => _QuestionAnswerCardState();
}

class _QuestionAnswerCardState extends State<QuestionAnswerCard> {
  void deleteComment(String questionId, String commentId) async {
    try {
      await FireStoreMethods().deleteQuestionComment(questionId, commentId);
      showSnackBar(context, 'Yorum Kaldırıldı!');
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: width * 0.5,
                      child: Column(
                        children: [
                          Text(
                            widget.snap['username'],
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.7, color: greyColor),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.snap['text'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16)),
                    ],
                  ),
                  const Divider(thickness: 0.7, color: greyColor),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28,
                child: CircleAvatar(
                    radius: 24,
                    foregroundImage: NetworkImage(widget.snap['photoUrl'])),
              ),
              widget.snap['id'] == FirebaseAuth.instance.currentUser!.uid
                  ? IconButton(
                      onPressed: () {
                        deleteComment(
                            widget.questionId, widget.snap['commentId']);
                      },
                      icon: const Icon(Icons.close))
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

class AnsverButton extends StatelessWidget {
  final Function()? func;
  const AnsverButton({Key? key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: func,
      backgroundColor: Colors.white,
      tooltip: 'Cevap Yaz',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/heart.png'),
      ),
    );
  }
}
