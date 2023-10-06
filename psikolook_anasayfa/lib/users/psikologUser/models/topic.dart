import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String uid;
  final String username;
  final String topicId;
  final DateTime datePublished;
  final String photoUrl;
  final String topicText;

  const Topic(
      {
      required this.uid,
      required this.username,
      required this.topicId,
      required this.datePublished,
      required this.photoUrl,
      required this.topicText});

  static Topic fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Topic(
      uid: snapshot["uid"]?? '',
      topicId: snapshot["topicId"]?? '',
      datePublished: snapshot["datePublished"]?? '',
      username: snapshot["username"]?? '',
      photoUrl: snapshot['photoUrl']?? '',
      topicText: snapshot['topicText']?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "topicId": topicId,
        "datePublished": datePublished,
        'photoUrl': photoUrl,
        'topicText': topicText,
      };
}
