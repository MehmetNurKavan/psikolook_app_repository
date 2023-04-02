import 'package:cloud_firestore/cloud_firestore.dart';

class DateAvailable {
  final String uid;
  final String username;
  final String dateId;
  final addDate;
  final String dateDay;

  const DateAvailable(
      {required this.uid,
      required this.username,
      required this.dateId,
      required this.addDate,
      required this.dateDay});

  static DateAvailable fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return DateAvailable(
        uid: snapshot["uid"] ?? '',
        username: snapshot["username"] ?? '',
        dateId: snapshot["dateId"] ?? '',
        addDate: snapshot["addDate"] ?? '',
        dateDay: snapshot["dateDay"]??'');
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "dateId": dateId,
        "datePublished": addDate,
        "dateDay": [dateDay]
      };
}
