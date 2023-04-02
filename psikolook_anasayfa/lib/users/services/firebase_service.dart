import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart';
import 'auth_user.dart';

class FirebaseAuthProvider /* implements AuthProvider  */ {
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    // This is the factory constructor for the AuthUser class.
    // It is returning a user object from core.
    // And basic control if user is not null then return instance of AuthUser or null.
    return user != null ? AuthUser.fromFirebase(user) : null;
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp();
  }

  Future<DocumentReference<Map<String, dynamic>>> add(
      Map<String, dynamic> data) async {
    return FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Stream<QuerySnapshot<Object?>> snapshots(
      {bool includeMetadataChanges = false}) {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('timestamp')
        .snapshots();
  }

}
