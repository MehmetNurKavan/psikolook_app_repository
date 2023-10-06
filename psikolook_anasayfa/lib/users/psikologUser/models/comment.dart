
import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String uid;
  final String username;
  final String commentId;
  final DateTime datePublished;
  final String photoUrl;
  final String text;

  const Comment(
      {required this.uid,
      required this.username,
      required this.commentId,
      required this.datePublished,
      required this.photoUrl,
      required this.text});

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Comment(
      uid: snapshot["uid"] ?? '',
      commentId: snapshot["commentId"] ?? '',
      datePublished: snapshot["datePublished"] ?? '',
      username: snapshot["username"] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      text: snapshot['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "commentId": commentId,
        "datePublished": datePublished,
        'photoUrl': photoUrl,
        'text': text,
      };
}
