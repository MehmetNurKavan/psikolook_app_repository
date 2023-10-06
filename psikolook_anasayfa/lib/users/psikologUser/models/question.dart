import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String uid;
  final String username;
  final String questionId;
  final DateTime datePublished;
  final String photoUrl;
  final String questionText;
  final String topicText;

  const Question(
      {required this.uid,
      required this.username,
      required this.questionId,
      required this.datePublished,
      required this.photoUrl,
      required this.questionText,
      required this.topicText});

  static Question fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Question(
      uid: snapshot["uid"] ?? '',
      questionId: snapshot["questionId"] ?? '',
      datePublished: snapshot["datePublished"] ?? '',
      username: snapshot["username"] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      questionText: snapshot['questionText'] ?? '',
      topicText: snapshot['topicText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "questionId": questionId,
        "datePublished": datePublished,
        'photoUrl': photoUrl,
        'questionText': questionText,
        'topicText':topicText,
      };
}
