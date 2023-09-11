import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/otherHome/psikolook/profil_read.dart';
import 'package:psikolook_anasayfa/widget/comment_card.dart';
import 'package:intl/intl.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();
  var userData = {};
  bool isPsikolog = false;
  bool isLoading = false;
  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            isPsikolog = true;
          });
        } else {
          isPsikolog = false;
        }
      });
      var userSnap = isPsikolog
          ? await FirebaseFirestore.instance
              .collection('PsikologUsers')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get()
          : await FirebaseFirestore.instance
              .collection('OtherUsers')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      userData = userSnap.data()!;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void postComment(String uid, String username, String photoUrl) async {
    try {
      String res = await FireStoreMethods().postComment(
        widget.snap['postId'],
        commentEditingController.text,
        uid,
        username,
        photoUrl,
      );
      if (res == 'success') {
        showSnackBar(context, 'Paylaşıldı');
        unfocus();
      } else {
        showSnackBar(context, res);
      }
      setState(() {
        commentEditingController.text = "";
      });
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor,
          ),
        ),
        child: isLoading
            ? Center(child: circleLoading())
            : SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 30.0, bottom: 10.0, top: 30.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                              color: Colors.black,
                              iconSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                bottom: 30.0,
                                top: 10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(1),
                                  leading: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ProfilRead(
                                                uid: widget.snap['uid']))),
                                    child: widget.snap['photoUrl'] != null ||
                                            widget.snap['photoUrl'] != ''
                                        ? CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                              widget.snap['photoUrl']
                                                  .toString(),
                                            ),
                                          )
                                        : const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/imges/default-usr'),
                                          ),
                                  ),
                                  title: InkWell(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ProfilRead(
                                                  uid: widget.snap['uid']))),
                                      child: Text(
                                          widget.snap['username'].toString())),
                                  subtitle: Text(DateFormat.yMMMd().format(
                                      widget.snap['datePublished'].toDate())),
                                  isThreeLine: true,
                                ),
                                Text(widget.snap['postText'].toString()),
                              ],
                            ),
                          )),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('posts')
                            .doc(
                              widget.snap['postId'],
                            )
                            .collection('comments')
                            .orderBy('datePublished', descending: true)
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
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) => CommentCard(
                              postId: widget.snap['postId'],
                              snap: snapshot.data!.docs[index],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
      ),

      // text input
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black,
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Row(
            children: [
              userData['photoUrl'] != null && userData['photoUrl'] != ''
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(userData['photoUrl']),
                        radius: 18,
                      ),
                    )
                  : Container(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    style: const TextStyle(color: Colors.white70),
                    controller: commentEditingController,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: 'Yazmaya başla',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => postComment(
                  userData['uid'] ?? '',
                  userData['username'] ?? '',
                  userData['photoUrl'] ?? '',
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Gönder',
                    style: TextStyle(color: blueColorAccent, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
          /* Container(
      color: Colors.black,
      child: Row(
        children: [
          userData['profImage'] != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(userData['profImage']),
                      radius: 18,
                    )
                  : Container(),
          Expanded(
            child: TextField(
              controller: commentEditingController,
              style: const TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0, style: BorderStyle.none),
          borderRadius:
              BorderRadius.all(Radius.circular(20))),
                  hintText: 'Bir mesaj yazın...',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 18.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () => postComment(
                  userData['uid'],
                  userData['username'],
                  userData['profImage'] ?? '',
                ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: const Text(
                'Gönder',
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 225, 230), fontSize: 18),
              ),
            ),
          ) 
        ],
      ),
    ),*/
        ),
      ),
    );
  }
}
