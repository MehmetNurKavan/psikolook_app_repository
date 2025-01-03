import 'package:cloud_firestore/cloud_firestore.dart';

class PsikologUser {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List interestField;
  final List followers;
  final String number;
  final int age;
  final String gender;
  final String degree;
  final String schoolName;
  final String institutionName;
  final bool kvkk;
  final bool userContract;
  final bool confirmation;
  final String pdfUrl;
  final String nickname;
  final String moneyValue;
  final String ibanValue;
  final String seansDkkValue;

  const PsikologUser({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.interestField,
    required this.followers,
    required this.number,
    required this.age,
    required this.gender,
    required this.degree,
    required this.schoolName,
    required this.institutionName,
    required this.kvkk,
    required this.userContract,
    required this.confirmation,
    required this.pdfUrl,
    required this.nickname,
    required this.ibanValue,
    required this.moneyValue,
    required this.seansDkkValue,
  });

  static PsikologUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PsikologUser(
      username: snapshot["username"] ?? '',
      uid: snapshot["uid"] ?? '',
      email: snapshot["email"] ?? '',
      photoUrl: snapshot["photoUrl"] ?? '',
      bio: snapshot["bio"] ?? '',
      interestField: snapshot["interestField"] ?? '',
      followers: snapshot["followers"] ?? '',
      number: snapshot["number"] ?? '',
      age: snapshot["age"] ?? '',
      gender: snapshot["gender"] ?? '',
      schoolName: snapshot["schoolName"] ?? '',
      institutionName: snapshot["institutionName"] ?? '',
      degree: snapshot["degree"] ?? '',
      kvkk: snapshot["kvkk"] ?? '',
      userContract: snapshot["userContract"] ?? '',
      confirmation: snapshot['confirmation'] ?? '',
      pdfUrl: snapshot['pdfUrl'] ?? '',
      nickname: snapshot['nickname'] ?? '',
      moneyValue: snapshot['moneyValue'] ?? '',
      ibanValue: snapshot['ibanValue'] ?? '',
      seansDkkValue:snapshot['seansDkkValue'] ?? '',
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
        'interestField': interestField,
        'schoolName': schoolName,
        'institutionName': institutionName,
        'degree': degree,
        'kvkk': kvkk,
        'userContract': userContract,
        'confirmation': confirmation,
        'pdfUrl': pdfUrl,
        'nickname': nickname,
        'moneyValue': moneyValue,
        'ibanValue': ibanValue,
        'seansDkkValue': seansDkkValue,
      };
}
