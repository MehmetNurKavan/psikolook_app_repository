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
      };
}
