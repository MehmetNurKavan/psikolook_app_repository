import 'package:cloud_firestore/cloud_firestore.dart';

class DateAvailable {
  final String uid;
  final String username;
  final String dateId;
  final String addDate;
  final String dateDay;
  final DateTime datePublished;
  final bool isVisible;
  final String photoUrl;
  final List interestField;
  final String degree;
  final String moneyValue;
  final String ibanValue;
  final String seansDkkValue;
  final bool isVolunteer;

  const DateAvailable({
    required this.uid,
    required this.username,
    required this.dateId,
    required this.addDate,
    required this.dateDay,
    required this.datePublished,
    required this.isVisible,
    required this.photoUrl,
    required this.interestField,
    required this.degree,
    required this.ibanValue,
    required this.moneyValue,
    required this.seansDkkValue,
    required this.isVolunteer,
  });

  static DateAvailable fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return DateAvailable(
      uid: snapshot["uid"] ?? '',
      username: snapshot["username"] ?? '',
      dateId: snapshot["dateId"] ?? '',
      addDate: snapshot["addDate"] ?? '',
      dateDay: snapshot["dateDay"] ?? '',
      datePublished: snapshot["datePublished"] ?? '',
      isVisible: snapshot["isVisible"] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      interestField: snapshot['interestField'] ?? '',
      degree: snapshot['degree'] ?? '',
      ibanValue: snapshot['ibanValue'] ?? '',
      moneyValue: snapshot['moneyValue'] ?? '',
      seansDkkValue: snapshot['seansDkkValue'] ?? '',
      isVolunteer: snapshot['isVolunteer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "dateId": dateId,
        "addDate": addDate,
        "dateDay": dateDay,
        "datePublished": datePublished,
        "isVisible": isVisible,
        "photoUrl": photoUrl,
        "interestField": interestField,
        'degree': degree,
        'moneyValue': moneyValue,
        'ibanValue': ibanValue,
        'seansDkkValue': seansDkkValue,
        'isVolunteer' : isVolunteer,
      };
}
