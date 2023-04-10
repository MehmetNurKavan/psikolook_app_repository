import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/blog.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/date_Available.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/group.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/post.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadBlog(String description, Uint8List file, String uid,
      String username, String blogText, String blogTime) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('blogs', file, true);
      String blogId = const Uuid().v1(); // creates unique id based on time
      Blog blog = Blog(
        description: description,
        uid: uid,
        username: username,
        blogId: blogId,
        datePublished: DateTime.now(),
        blogUrl: photoUrl,
        blogText: blogText,
        blogTime: blogTime,
      );
      _firestore.collection('blogs').doc(blogId).set(blog.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Blog
  Future<String> deleteBlog(String blogId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('blogs').doc(blogId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadPost(
      String uid, String username, String profImage, String postText) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postId = const Uuid().v1(); // creates unique id based on time
      Post post = Post(
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        profImage: profImage,
        postText: postText,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Post comment
  Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('Psikolog Users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('Psikolog Users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('Psikolog Users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('Psikolog Users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('Psikolog Users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> uploadDateAvailable(
      String uid, String username, String dateDay, addDate) async {
    String res = "Some error occurred";
    try {
      String dateId = const Uuid().v1();
      DateAvailable dateAveliable = DateAvailable(
          uid: uid,
          username: username,
          dateId: dateId,
          addDate: addDate,
          dateDay: dateDay);
      _firestore
          .collection('dateAvailable')
          .doc(dateId)
          .set(dateAveliable.toJson());
      /* _firestore.collection('dateAveliable').doc(dateId).update({
          'addDate': FieldValue.arrayUnion([uid])
        }); */
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  /* Future<String> addTime(String dateId, String uid, List addTime) async {
    String res = "Some error occurred";
    try {
      if (addTime.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('dateAveliable').doc(dateId).update({
          'addTime': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('dateAveliable').doc(dateId).update({
          'addTime': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  } */
  Future<String> uploadNewTopluluk(String uid, String toplulukTitle) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String groupId = const Uuid().v1(); // creates unique id based on time
      Topluluk group = Topluluk(
        groupId: groupId,
        toplulukTitle: toplulukTitle,
      );
      _firestore.collection('Topluluk').doc(groupId).set(group.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
   // Delete Post
  Future<String> deleteToplulukGroup(String groupId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('Topluluk').doc(groupId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
