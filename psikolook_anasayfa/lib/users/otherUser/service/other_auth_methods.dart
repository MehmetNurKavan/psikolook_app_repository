import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psikolook_anasayfa/users/otherUser/models/other_user.dart'
    as model;
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';
import 'package:psikolook_anasayfa/users/services/auth_exception.dart';

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
    Uint8List? file,
    required String number,
    required String age,
    required String gender,
    String? schoolName,
    String? job,
    required String complaint,
    String? schoolClass,
    String? schoolJob,
    required bool kvkk,
    required bool userContract,
    Uint8List? castawayFile,
  }) async {
    String res = "Bir hata ile karşılaşıldı!";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          number.isNotEmpty &&
          age.isNotEmpty &&
          complaint.isNotEmpty &&
          gender.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //e-posta adresinde herhangi bir hata yoksa kimlik doğrulaması için e-posta gönderir.
        cred.user!.sendEmailVerification();
        String photoUrl;
        if (file == null || file.isEmpty) {
          photoUrl = '';
        } else {
          photoUrl = await StorageMethods()
              .uploadImageToStorage('profilePics', file, false);
        }
        String castawayUrl;
        if (castawayFile == null || castawayFile.isEmpty) {
          castawayUrl = '';
        } else {
          castawayUrl = await StorageMethods().upLoadPdftoStorage(castawayFile);
        }

        model.OtherUser _user = model.OtherUser(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          age: age,
          gender: gender,
          number: number,
          schoolName: schoolName ?? '',
          job: job ?? '',
          complaint: complaint,
          schoolClass: schoolClass ?? '',
          schoolJob: schoolJob ?? '',
          kvkk: kvkk,
          userContract: userContract,
          nickname: '',
          following: [],
          castawayUrl: castawayUrl,
          castawayConfirmation: false,
        );
        // adding user in our database
        await _firestore
            .collection("OtherUsers")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res =
            "Kayıt Başarılı, E-posta adresinize aktivasyon maili gönderildi. Lütfen aktivasyon işlemini tamamlayıp giriş yapınız.";
      } else {
        res = "Lütfen zorunlu olan tüm değerleri giriniz!";
      }
    } on FirebaseAuthException catch (e) {
      res = firebaseException(res, e);
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging auth__method kısmında var

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String?> forgotPassword(String email) async {
    String? res;
    try {
      if (email != '') {
        await _auth.sendPasswordResetEmail(email: email).then((value) => value);
        res = 'e-posta adresinizi kontrol ediniz';
      } else {
        res = 'epostayı dogru girdiginize emin olun';
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      res = firebaseException(res, e);
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateOtherUser({
    required String username,
    Uint8List? file,
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
      if (username.isNotEmpty ||
          number.isNotEmpty ||
          age.isEmpty ||
          complaint.isNotEmpty ||
          gender.isNotEmpty ||
          schoolName.isNotEmpty ||
          schoolClass.isNotEmpty ||
          schoolJob.isNotEmpty ||
          file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file!, false);
        // adding user in our database
        await _firestore
            .collection("OtherUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'username': username,
          'number': number,
          'age': age,
          'gender': gender,
          'schoolName': schoolName,
          'job': job,
          'complaint': complaint,
          'schoolClass': schoolClass,
          'schoolJob': schoolJob,
          'photoUrl': photoUrl
        });
        res = "Kayıt Başarılı";
      } else if (file == null) {
        await _firestore
            .collection("OtherUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'username': username,
          'number': number,
          'age': age,
          'gender': gender,
          'schoolName': schoolName,
          'job': job,
          'complaint': complaint,
          'schoolClass': schoolClass,
          'schoolJob': schoolJob,
        });
        res = "Kayıt Başarılı";
      } else {
        res = "Lütfen zorunlu olan tüm değerleri giriniz!";
      }
    } on FirebaseAuthException catch (e) {
      res = firebaseException(res, e);
      print(e.code);
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateOtherUserField({
    required String field,
    required String value,
  }) async {
    String res = 'Bir hata ile karşılaşıldı';
    try {
      if (value != '') {
        await _firestore
            .collection("OtherUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          field: value,
        });
        res = "Kayıt Başarılı";
      } else {
        res = 'Boş değer girilemez';
      }
    } catch (e) {
      print(e);
    }
    return res;
  }

  Future<String> updateOtherUserImage({
    required Uint8List file,
  }) async {
    String res = 'Bir hata ile karşılaşıldı';
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('profilePics', file, false);
      await _firestore
          .collection("OtherUsers")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'photoUrl': photoUrl,
      });
      res = "Kayıt Başarılı";
    } catch (e) {
      print(e);
    }
    return res;
  }

  Future<String> updateNickNameOtherUser({
    required String nickname,
  }) async {
    String res = "Some error Occurred";
    try {
      if (nickname.isNotEmpty) {
        await _firestore
            .collection("OtherUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'nickname': nickname,
        });
        res = "Kayıt Başarılı";
      } else {
        res = "Lütfen tüm değerleri giriniz!";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateOtherUserConfirm({
    required String uid,
    required bool confirmation,
  }) async {
    String res = "Some error Occurred";
    try {
      await _firestore
          .collection("OtherUsers")
          .doc(uid)
          .update({'castawayConfirmation': confirmation});
      res = "Kayıt Başarılı";
    } on FirebaseAuthException catch (e) {
      res = firebaseException(res, e);
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
