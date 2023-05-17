import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final String postText;

  const Post(
      {
      required this.uid,
      required this.username,
      required this.likes,
      required this.postId,
      required this.datePublished,
      required this.profImage,
      required this.postText});

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      uid: snapshot["uid"]?? '',
      likes: snapshot["likes"]?? '',
      postId: snapshot["postId"]?? '',
      datePublished: snapshot["datePublished"]?? '',
      username: snapshot["username"]?? '',
      profImage: snapshot['profImage']?? '',
      postText: snapshot['postText']?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'profImage': profImage,
        'postText': postText,
      };
}