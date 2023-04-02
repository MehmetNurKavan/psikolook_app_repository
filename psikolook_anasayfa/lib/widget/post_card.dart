import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/psikolog_user.dart'
    as model;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
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

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /* final model.PsikologUser user = Provider.of<PsikologUserProvider>(context).getUser; */
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
              width: 0.4, color: Color.fromARGB(255, 201, 201, 201))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: ListTile(
              contentPadding: const EdgeInsets.all(1),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.snap['profImage'].toString(),
                  ),
                ),
              ),
              title: Text(widget.snap['username'].toString()),
              subtitle: Text(DateFormat.yMMMd()
                  .format(widget.snap['datePublished'].toDate())),
              //isThreeLine: true, //alanını genisletiyor,yerlestiriyor
              //dense: true, //alanını daraltiyor gibi
              /* trailing: widget.snap['uid'].toString() == user.uid
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    )
                  : Container(), */
            ),
          ),
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              child: Text(
                widget.snap['postText'].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
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
                    /* Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                          postId: widget.snap['postId'].toString(),
                        ),
                      ),
                    ); */
                  },
                  icon: const Icon(Icons.chat_bubble_outline,
                      color: Color.fromARGB(255, 174, 220, 225))),

              Text(
                widget.snap['likes'].length.toString(),
              ),
              //!you need change fav icon. you add to infinity icon
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/infinity_add_icon.png'),
              )
              /* LikeAnimation(
                isAnimating: widget.snap['likes'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['likes'].contains(user.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  onPressed: () {
                    setState(() {
                      FireStoreMethods().likePost(
                        widget.snap['postId'].toString(),
                        user.uid,
                        widget.snap['likes'],
                      );
                    });
                  },
                ),
              ), */
            ],
          ),
        ],
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
