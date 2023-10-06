import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/blog.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/captions.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/comment.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/date_available.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/group.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/post.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/question.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/survay.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/topic.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadBlog(
      String description,
      Uint8List file,
      String uid,
      String username,
      String blogText,
      String blogTime,
      String photoUrl) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String blogUrl =
          await StorageMethods().uploadImageToStorage('blogs', file, true);
      String blogId = const Uuid().v1(); // creates unique id based on time
      Blog blog = Blog(
          description: description,
          uid: uid,
          username: username,
          blogId: blogId,
          datePublished: DateTime.now(),
          blogUrl: blogUrl,
          blogText: blogText,
          blogTime: blogTime,
          photoUrl: photoUrl);
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
      String uid, String username, String photoUrl, String postText) async {
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
        photoUrl: photoUrl,
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
      String username, String photoUrl) async {
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
          'photoUrl': photoUrl,
          'username': username,
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

  Future<String> deletepostComment(String postId, String commentId) async {
    String res = "Some error occurred";
    try {
      await _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
      res = 'success';
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

  // Delete Date
  Future<String> deleteDate(String dateId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('dateAvailable').doc(dateId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // update Date 'add to other uid,name'
  Future<String> updateDate(String dateId, String otherName, String otherUid,
      String otherPhotoUrlUrl) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('dateAvailable').doc(dateId).update({
        'otherUid': otherUid,
        'isVisible': false,
        'otherName': otherName,
        'otherPhotoUrl': otherPhotoUrlUrl
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // update Date 'remove to other uid,name'
  Future<String> updateDate2(String dateId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('dateAvailable').doc(dateId).update({
        'otherUid': '',
        'isVisible': true,
        'otherName': '',
        'otherPHotoUrl': '',
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // update Date 'meet link'
  Future<String> updateDate3(String dateId, String meetLink) async {
    String res = "Some error occurred";
    try {
      await _firestore
          .collection('dateAvailable')
          .doc(dateId)
          .update({'meetLink': meetLink});
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // update Date 'money , seans dkk'
  Future<String> updateDate4(
      String uid, String moneyValue, String seansDkkValue) async {
    String res = "Some error occurred";
    try {
      if ((moneyValue == null || moneyValue == '') &&
          (seansDkkValue == null || seansDkkValue == '')) {
        res = 'not change';
      } else if ((moneyValue == null || moneyValue == '') &&
          (seansDkkValue != null || seansDkkValue != '')) {
        await _firestore
            .collection('PsikologUsers')
            .doc(uid)
            .update({'seansDkkValue': seansDkkValue});
        res = 'success';
      } else if ((moneyValue != null || moneyValue != '') &&
          (seansDkkValue == null || seansDkkValue == '')) {
        await _firestore
            .collection('PsikologUsers')
            .doc(uid)
            .update({'moneyValue': moneyValue});
        res = 'success';
      } else {
        await _firestore
            .collection('PsikologUsers')
            .doc(uid)
            .update({'moneyValue': moneyValue, 'seansDkkValue': seansDkkValue});
        res = 'success';
      }
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
          await _firestore.collection('OtherUsers').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('PsikologUsers').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('OtherUsers').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('PsikologUsers').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('OtherUsers').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> uploadDateAvailable(
      String uid,
      String username,
      String dateDay,
      addDate,
      DateTime datePublished,
      String photoUrl,
      List interestField,
      String degree,
      String moneyValue,
      String ibanValue,
      String seansDkkValue) async {
    String res = "Some error occurred";
    try {
      String dateId = const Uuid().v1();
      DateAvailable dateAveliable = DateAvailable(
        uid: uid,
        username: username,
        dateId: dateId,
        addDate: addDate,
        dateDay: dateDay,
        datePublished: datePublished,
        isVisible: true,
        photoUrl: photoUrl,
        interestField: interestField,
        degree: degree,
        ibanValue: ibanValue,
        moneyValue: moneyValue,
        seansDkkValue: seansDkkValue,
        isVolunteer: false,
      );
      _firestore
          .collection('dateAvailable')
          .doc(dateId)
          .set(dateAveliable.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadDateAvailableVolunteer(
      String uid,
      String username,
      String dateDay,
      addDate,
      DateTime datePublished,
      String photoUrl,
      List interestField,
      String degree,
      String seansDkkValue) async {
    String res = "Some error occurred";
    try {
      String dateId = const Uuid().v1();
      DateAvailable dateAveliable = DateAvailable(
        uid: uid,
        username: username,
        dateId: dateId,
        addDate: addDate,
        dateDay: dateDay,
        datePublished: datePublished,
        isVisible: true,
        photoUrl: photoUrl,
        interestField: interestField,
        degree: degree,
        seansDkkValue: seansDkkValue,
        ibanValue: '',
        moneyValue: '',
        isVolunteer: true,
      );
      _firestore
          .collection('dateAvailable')
          .doc(dateId)
          .set(dateAveliable.toJson());
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
  Future<String> uploadNewSurvey(String uid, String surveyTitle,
      String surveyName, String surveyLink) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String surveyId = const Uuid().v1(); // creates unique id based on time
      Survey survey = Survey(
        uid: uid,
        surrveyTitle: surveyTitle,
        surveyId: surveyId,
        surveyLink: surveyLink,
        surveyName: surveyName,
      );
      _firestore.collection('Survey').doc(surveyId).set(survey.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Topluluk **** <--------> ****
  Future<String> uploadNewTopluluk(String uid, String toplulukTitle) async {
    String res = "Some error occurred";
    try {
      String groupId = const Uuid().v1();
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

  Future<String> deleteToplulukGroup(
      String groupId, String toplulukTitle) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('Topluluk').doc(groupId).delete();
      await _firestore
          .collection(toplulukTitle.toString())
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//Form **** <--------> ****
  Future<String> uploadTopic(
      String uid, String username, String photoUrl, String topicText) async {
    String res = "Some error occurred";
    try {
      String topicId = const Uuid().v1();
      Topic topic = Topic(
        uid: uid,
        username: username,
        topicId: topicId,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        topicText: topicText,
      );
      _firestore.collection('topics').doc(topicId).set(topic.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteTopic(String topicId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('topics').doc(topicId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadCaption(String uid, String username, String photoUrl,
      String captionText, String topicText) async {
    String res = "Some error occurred";
    try {
      String captionId = const Uuid().v1();
      Caption caption = Caption(
        uid: uid,
        username: username,
        captionId: captionId,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        topicText: topicText,
        captionText: captionText,
      );
      _firestore.collection('captions').doc(captionId).set(caption.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteCaption(String captionId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('captions').doc(captionId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadQuestion(String uid, String username, String photoUrl,
      String questionText, String topicText) async {
    String res = "Some error occurred";
    try {
      String questionId = const Uuid().v1();
      Question question = Question(
        uid: uid,
        username: username,
        questionId: questionId,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        topicText: topicText,
        questionText: questionText,
      );
      _firestore.collection('questions').doc(questionId).set(question.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteQuestion(String questionId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('questions').doc(questionId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> questionComment(String questionId, String text, String uid,
      String username, String photoUrl) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        Comment comment = Comment(
          uid: uid,
          username: username,
          commentId: commentId,
          datePublished: DateTime.now(),
          photoUrl: photoUrl,
          text: text,
        );
        _firestore
            .collection('questions')
            .doc(questionId)
            .collection('comments')
            .doc(commentId)
            .set(comment.toJson());
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteQuestionComment(
      String questionId, String commentId) async {
    String res = "Some error occurred";
    try {
      await _firestore
          .collection('questions')
          .doc(questionId)
          .collection('comments')
          .doc(commentId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> captionComment(String captionId, String text, String uid,
      String username, String photoUrl) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        Comment comment = Comment(
          uid: uid,
          username: username,
          commentId: commentId,
          datePublished: DateTime.now(),
          photoUrl: photoUrl,
          text: text,
        );
        _firestore
            .collection('captions')
            .doc(captionId)
            .collection('comments')
            .doc(commentId)
            .set(comment.toJson());
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteCaptionComment(
      String captionId, String commentId) async {
    String res = "Some error occurred";
    try {
      await _firestore
          .collection('Captions')
          .doc(captionId)
          .collection('comments')
          .doc(commentId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
