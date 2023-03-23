import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final String number;
  final String age;
  final String gender;
  final String degree;
  final String schoolName;
  final String institutionName;

  const User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.followers,
    required this.number,
    required this.age,
    required this.gender,
    required this.degree,
    required this.schoolName,
    required this.institutionName,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"] ?? '',
      uid: snapshot["uid"] ?? '',
      email: snapshot["email"] ?? '',
      photoUrl: snapshot["photoUrl"] ?? '',
      bio: snapshot["bio"] ?? '',
      followers: snapshot["followers"] ?? '',
      number: snapshot["number"] ?? '',
      age: snapshot["age"] ?? '',
      gender: snapshot["gender"] ?? '',
      schoolName: snapshot["schoolName"] ?? '',
      institutionName: snapshot["institutionName"] ?? '',
      degree: snapshot["degree"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        'number': number,
        'age': age,
        'gender': gender,
        'schoolName': schoolName,
        'institutionName': institutionName,
        'degree': degree,
      };
}
