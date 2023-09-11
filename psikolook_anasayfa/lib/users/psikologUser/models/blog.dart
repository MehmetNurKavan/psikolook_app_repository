import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String description;
  final String uid;
  final String username;
  final String blogId;
  final DateTime datePublished;
  final String blogUrl;
  final String blogText;
  final String blogTime;
  final String photoUrl;

  const Blog(
      {required this.description,
      required this.uid,
      required this.username,
      required this.blogId,
      required this.datePublished,
      required this.blogUrl,
      required this.blogText,
      required this.blogTime,
      required this.photoUrl,
      });

  static Blog fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Blog(
      description: snapshot["description"] ?? '',
      uid: snapshot["uid"] ?? '',
      blogId: snapshot["blogId"] ?? '',
      datePublished: snapshot["datePublished"] ?? '',
      username: snapshot["username"] ?? '',
      blogUrl: snapshot['blogUrl'] ?? '',
      blogText: snapshot['blogText'] ?? '',
      blogTime: snapshot['blogTime'] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "blogId": blogId,
        "datePublished": datePublished,
        'blogUrl': blogUrl,
        'blogText': blogText,
        'blogTime': blogTime,
        'photoUrl':photoUrl,
      };
}
