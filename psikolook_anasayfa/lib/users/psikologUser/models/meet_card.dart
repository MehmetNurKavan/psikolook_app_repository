import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingCard {
    final String uid;
  final String username;
  final String dateId;
  final String addDate;
  final String dateDay;
  MeetingCard({
    required this.uid,
      required this.username,
      required this.dateId,
      required this.addDate,
      required this.dateDay
  });
    static MeetingCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return MeetingCard(
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
        "addDate": addDate,
        "dateDay": dateDay
      };
}
