import 'package:cloud_firestore/cloud_firestore.dart';

class OtherUser {
  final String email;
  final String uid;
  final String username;
  final String photoUrl;
  final String number;
  final String age;
  final String gender;
  final String complaint;
  final String job;
  final String schoolName;
  final String schoolJob;
  final String schoolClass;
  final bool kvkk;
  final bool userContract;
  final String nickname;
  final List following;
  final String castawayUrl;
  final bool castawayConfirmation;

  const OtherUser({
    required this.email,
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.number,
    required this.age,
    required this.gender,
    required this.complaint,
    required this.job,
    required this.schoolName,
    required this.schoolJob,
    required this.schoolClass,
    required this.kvkk,
    required this.userContract,
    required this.nickname,
    required this.following,
    required this.castawayUrl,
    required this.castawayConfirmation,
  });

  static OtherUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return OtherUser(
      email: snapshot["email"] ?? '',
      uid: snapshot["uid"] ?? '',
      username: snapshot["username"] ?? '',
      photoUrl: snapshot["photoUrl"] ?? '',
      number: snapshot["number"] ?? '',
      age: snapshot["age"] ?? '',
      gender: snapshot["gender"] ?? '',
      complaint: snapshot["complaint"] ?? '',
      job: snapshot["job"] ?? '',
      schoolName: snapshot["schoolName"] ?? '',
      schoolJob: snapshot["schoolJob"] ?? '',
      schoolClass: snapshot["schoolClass"] ?? '',
      kvkk: snapshot["kvkk"] ?? '',
      userContract: snapshot["userContract"] ?? '',
      nickname: snapshot["nickname"] ?? '',
      following: snapshot['following'] ?? '',
      castawayUrl: snapshot['castawayUrl'] ?? '',
      castawayConfirmation: snapshot['castawayConfirmation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        'number': number,
        'age': age,
        'gender': gender,
        'complaint': complaint,
        'job': job,
        'schoolName': schoolName,
        'schoolJob': schoolJob,
        'schoolClass': schoolClass,
        'kvkk': kvkk,
        'userContract': userContract,
        'nickname': nickname,
        'following': following,
        'castawayUrl': castawayUrl,
        'castawayConfirmation': castawayConfirmation,
      };
}
