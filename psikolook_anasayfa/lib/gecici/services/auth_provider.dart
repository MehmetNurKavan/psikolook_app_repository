import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psikolook_anasayfa/gecici/services/auth_user.dart';

abstract class AuthProvider {
  // Those are  simply we are creating a class that has properties that already exist in the FireBase.
  // And  we are using only what we need in our app.
  // And basically creating a layer for our app is not talking directly to the FireBase.

  AuthUser? get currentUser;
  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });
  Future<AuthUser?> register({
    required String email,
    required String password,
    required String fullName,
    required String number,
    required String age,
    required String gender,
    required String complaint,
    String job,
    String schoolName,
    String schoolJob,
    String schoolClass,
  });
  Future<void> logOut();
  Future<void> initializeApp();
  Future<DocumentReference<Map<String, dynamic>>> add(
      Map<String, dynamic> data);
  Stream<QuerySnapshot<Object?>> snapshots({bool includeMetadataChanges = false});
}
