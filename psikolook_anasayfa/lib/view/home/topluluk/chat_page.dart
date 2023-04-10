import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/constant/constants.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/message_buble.dart';
import 'package:psikolook_anasayfa/users/services/auth_user.dart';
import 'package:psikolook_anasayfa/users/services/firebase_service.dart';

class ChatPage extends StatefulWidget {
  final snap;
  const ChatPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final _textController;
  final _auth = FirebaseAuthProvider();
  AuthUser? loggedInUser;

  void checkUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    checkUser();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(widget.snap['toplulukTitle'],
            style: const TextStyle(color: Colors.black45, fontSize: 16)),
        backgroundColor: backGroundColor[0],
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Topluluk',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 20),
        ],
        iconTheme: const IconThemeData(color: Colors.black45),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data;
                  final messageBubbles = <MessageBubble>[];
                  for (var message in messages!.docs.reversed) {
                    final userMessage = message.data() as Map<String, dynamic>;
                    final messageText = userMessage['text'];
                    final messageSender = userMessage['sender'];
                    final timestamp = userMessage['timestamp'];
                    final currentUser = loggedInUser!.userEmail;
                    final messageBubble = MessageBubble(
                        text: messageText,
                        sender: messageSender,
                        isMe: currentUser == messageSender,
                        timestamp: timestamp ?? Timestamp.now());
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: Constants.chatBubbleRadius,
                      children: messageBubbles,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
              stream: snapshotsS(),
            ),
            Container(
              height: 50,
              color: backGroundColor[1],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: Constants.typeMessage,
                        contentPadding: Constants.buttonPadding,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'login',
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.black45),
                      padding: Constants.buttonPadding,
                      onPressed: () async {
                        if (_textController.text.isNotEmpty) {
                          addMessage({
                            'text': _textController.text,
                            'sender': loggedInUser!.userEmail,
                            'timestamp': FieldValue.serverTimestamp(),
                          });
                          _textController.clear();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DocumentReference<Map<String, dynamic>>> addMessage(
      Map<String, dynamic> data) async {
    return FirebaseFirestore.instance
        .collection(widget.snap['toplulukTitle'].toString())
        .add(data);
  }

  @override
  Stream<QuerySnapshot<Object?>> snapshotsS(
      {bool includeMetadataChanges = false}) {
    return FirebaseFirestore.instance
        .collection(widget.snap['toplulukTitle'].toString())
        .orderBy('timestamp')
        .snapshots();
  }
}
