import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psikolook_anasayfa/models/user.dart' as model;
import 'package:psikolook_anasayfa/service/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('PsikologUsers').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file,
      required String number,
      required String age,
      required String gender,
      required String schoolName,
      required String degree,
      required String institutionName}) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          number.isNotEmpty ||
          age.isEmpty ||
          degree.isNotEmpty ||
          gender.isNotEmpty ||
          schoolName.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
            username: username,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            email: email,
            bio: bio,
            followers: [],
            age: age,
            gender: gender,
            number: number,
            schoolName: schoolName,
            degree: degree,
            institutionName: institutionName);
        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
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
      final result = await _auth.sendPasswordResetEmail(email: email);
      print("Mail kutunuzu kontrol ediniz");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        res = "Mail Zaten Kayitli.";
      }
    }
    return res;
  }
}
