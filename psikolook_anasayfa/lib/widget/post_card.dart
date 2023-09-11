import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/otherHome/psikolook/profil_read.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/comments_screen.dart';
import 'package:psikolook_anasayfa/widget/like_animation.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;
  bool isLike = false;
  int likelength = 0;
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    isLike =
        widget.snap['likes'].contains(FirebaseAuth.instance.currentUser!.uid);
    likelength = widget.snap['likes'].length;
    setState(() {});
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
      showSnackBar(
        context,
        'Post Kaldırıldı!',
      );
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(width: 0.4, color: greyColor)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(1),
              leading: 
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilRead(uid: widget.snap['uid']))),
                    child: 
              widget.snap['photoUrl'] != null ||
                      widget.snap['photoUrl'] != ''
                  ? CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          widget.snap['photoUrl'].toString(),
                        ),
                      )
                  : const CircleAvatar(
                      backgroundImage: AssetImage('assets/imges/default-usr'),
                    ),),
              title: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilRead(uid: widget.snap['uid']))),
                child: Text(widget.snap['username'].toString())),
              subtitle: Text(DateFormat('dd.MM.yyyy')
                  .format(widget.snap['datePublished'].toDate())),
              //isThreeLine: true, //alanını genisletiyor,yerlestiriyor
              dense: true, //alanını daraltiyor gibi
              trailing: widget.snap['uid'] != uid
                  ? null
                  : IconButton(
                      onPressed: () {
                        showDialog(
                          useRootNavigator: false,
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: ListView(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  children: ['Postu Sil !']
                                      .map(
                                        (e) => InkWell(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                            onTap: () {
                                              deletePost(
                                                widget.snap['postId']
                                                    .toString(),
                                              );
                                              // remove the dialog box
                                              Navigator.of(context).pop();
                                            }),
                                      )
                                      .toList()),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
            ),
            Text(
              widget.snap['postText'],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CommentsScreen(snap: widget.snap)));
                    },
                    child: const Text('devamını oku',
                        style: TextStyle(decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: share,
                  icon: const Icon(Icons.share_outlined),
                ),
                const SizedBox(),
                const SizedBox(),
                const SizedBox(),
                Text('$commentLen'),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CommentsScreen(
                            snap: widget.snap,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Color.fromARGB(255, 174, 220, 225))),
                const SizedBox(),
                Text(
                  likelength.toString(),
                ),
                //!you need change fav icon. you add to infinity icon
                /* IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/infinity_add_icon.png'),
                ) */
                LikeAnimation(
                  isAnimating: widget.snap['likes'].contains(uid),
                  smallLike: true,
                  child: IconButton(
                    icon: isLike
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                          ),
                    onPressed: () {
                      setState(() {
                        isLike = !isLike;
                        isLike == false ? --likelength : ++likelength;
                        FireStoreMethods().likePost(
                          widget.snap['postId'].toString(),
                          uid,
                          widget.snap['likes'],
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Psikolook paylaş',
        text: 'Psikolook',
        linkUrl:
            'https://instagram.com/psiko.look?igshid=YmMyMTA2M2Y=', //burası backende giriyor
        chooserTitle: 'Paylaş');
  }
}
