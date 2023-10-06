import 'package:cloud_firestore/cloud_firestore.dart';

class Caption {
  final String uid;
  final String username;
  final String captionId;
  final DateTime datePublished;
  final String photoUrl;
  final String captionText;
  final String topicText;

  const Caption(
      {required this.uid,
      required this.username,
      required this.captionId,
      required this.datePublished,
      required this.photoUrl,
      required this.captionText,
      required this.topicText});

  static Caption fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Caption(
      uid: snapshot["uid"] ?? '',
      captionId: snapshot["topicId"] ?? '',
      datePublished: snapshot["datePublished"] ?? '',
      username: snapshot["username"] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      captionText: snapshot['topicText'] ?? '',
      topicText: snapshot['topicText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "captionId": captionId,
        "datePublished": datePublished,
        'photoUrl': photoUrl,
        'captionText': captionText,
        'topicText':topicText,
      };
}
