import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class CommentCard extends StatefulWidget {
  final postId;
  final snap;
  const CommentCard({Key? key, required this.postId, required this.snap})
      : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void deletePostComment(String postId, String commnetId) async {
    try {
      String res =
          await FireStoreMethods().deletepostComment(postId, commnetId);
      if (res == 'success') {
        showSnackBar(context, 'Yorum Kaldırıldı');
        unfocus();
      } else {
        showSnackBar(context, res);
      }
      Navigator.pop(context);
      setState(() {});
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.snap.data()['username'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.snap.data()['photoUrl'] != null ||
                  widget.snap.data()['photoUrl'] != ''
              ? CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    widget.snap.data()['photoUrl'],
                  ),
                  radius: 18,
                )
              : const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  backgroundImage: AssetImage('assets/imges/default-usr'),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '${widget.snap.data()['text']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          widget.snap.data()['uid'] == FirebaseAuth.instance.currentUser!.uid
              ? IconButton(
                  icon: const Icon(Icons.close, size: 16),
                  onPressed: () {
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: ['Yorumu Kaldır']
                                  .map(
                                    (e) => InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                        onTap: () {
                                          deletePostComment(
                                            widget.postId,
                                            widget.snap['commentId'],
                                          );
                                        }),
                                  )
                                  .toList()),
                        );
                      },
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
