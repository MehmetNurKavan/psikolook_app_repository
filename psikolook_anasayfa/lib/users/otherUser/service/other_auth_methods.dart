import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psikolook_anasayfa/users/otherUser/models/other_user.dart' as model;
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';

class OtherAuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.OtherUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('OtherUsers').doc(currentUser.uid).get();

    return model.OtherUser.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
    required String number,
    required String age,
    required String gender,
    required String schoolName,
    required String job,
    required String complaint,
    required String schoolClass,
    required String schoolJob,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          number.isNotEmpty ||
          age.isEmpty ||
          complaint.isNotEmpty ||
          gender.isNotEmpty ||
          schoolName.isNotEmpty ||
          schoolClass.isNotEmpty ||
          schoolJob.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.OtherUser _user = model.OtherUser(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          age: age,
          gender: gender,
          number: number,
          schoolName: schoolName,
          job: job,
          complaint: complaint,
          schoolClass: schoolClass,
          schoolJob: schoolJob,
        );
        // adding user in our database
        await _firestore
            .collection("OtherUsers")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "Kayıt Başarılı";
      } else {
        res = "Lütfen tüm değerleri giriniz!";
      }
    } on FirebaseAuthException catch (e) {
      print('HATA!');
      if (e.code == 'weak-password') {
        res = 'zayıf şifre';
      } else if (e.code == 'email-already-in-use') {
        res = 'zaten kullanımda olan e-posta';
      } else if (e.code == 'user-not-found') {
        res = 'kullanıcı bulunamadı';
      } else if (e.code == 'wrong-password') {
        res = 'yanlış şifre';
      }
      print(e.code); //Add this line to see other firebase exceptions.
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String?> forgotPassword(String email) async {
    String? res;
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) => value);
      res = 'e-posta adresinizi kontrol ediniz';
    } on FirebaseAuthException catch (e) {
      print(e);
      res = e.message.toString();
    }
    return res;
  }


  Future<String> updateOtherUser({
    required String username,
    required Uint8List file,
    required String number,
    required String age,
    required String gender,
    required String schoolName,
    required String job,
    required String complaint,
    required String schoolClass,
    required String schoolJob,
  }) async {
    String res = "Some error Occurred";
    try {
      if (
          username.isNotEmpty ||
          number.isNotEmpty ||
          age.isEmpty ||
          complaint.isNotEmpty ||
          gender.isNotEmpty ||
          schoolName.isNotEmpty ||
          schoolClass.isNotEmpty ||
          schoolJob.isNotEmpty ||
          file != null) {

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // adding user in our database
        await _firestore
            .collection("OtherUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid).update(
              {
                'username':username,
                'number':number,
                'age':age,
                'gender':gender,
                'schoolName':schoolName,
                'job':job,
                'complaint':complaint,
                'schoolClass':schoolClass,
                'schoolJob':schoolJob,
              }
            );
        res = "Kayıt Başarılı";
      } else {
        res = "Lütfen tüm değerleri giriniz!";
      }
    } on FirebaseAuthException catch (e) {
      print('HATA!');
      if (e.code == 'weak-password') {
        res = 'zayıf şifre';
      } else if (e.code == 'email-already-in-use') {
        res = 'zaten kullanımda olan e-posta';
      } else if (e.code == 'user-not-found') {
        res = 'kullanıcı bulunamadı';
      } else if (e.code == 'wrong-password') {
        res = 'yanlış şifre';
      }
      print(e.code);
    } catch (err) {
      return err.toString();
    }
    return res;
  }

}
