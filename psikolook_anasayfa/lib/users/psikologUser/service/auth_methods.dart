import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/psikolog_user.dart'
    as model;
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.PsikologUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('PsikologUsers').doc(currentUser.uid).get();

    return model.PsikologUser.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required String interestField,
      required Uint8List file,
      required String number,
      required int age,
      required String gender,
      required String schoolName,
      required String degree,
      required String institutionName,
      required bool kvkk,
      required bool userContract,
      required Uint8List pdfFile}) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          number.isNotEmpty ||
          age.toString().isEmpty ||
          degree.isNotEmpty ||
          gender.isNotEmpty ||
          schoolName.isNotEmpty ||
          pdfFile != null ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //e-posta adresinde herhangi bir hata yoksa kimlik doğrulaması için e-posta gönderir.
        cred.user!.sendEmailVerification();
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        String pdfUrl = await StorageMethods().upLoadPdftoStorage(pdfFile);
        model.PsikologUser user = model.PsikologUser(
            username: username,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            email: email,
            bio: bio,
            interestField: interestField,
            followers: [],
            age: age,
            gender: gender,
            number: number,
            schoolName: schoolName,
            degree: degree,
            institutionName: institutionName,
            kvkk: kvkk,
            userContract: userContract,
            confirmation: false,
            pdfUrl: pdfUrl);
        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "Kayıt Başarılı, E-posta adresinize aktivasyon maili gönderildi. Lütfen aktivasyon işlemini tamamlayıp giriş yapınız.";
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
    String res = "Bir hata oluştu";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User fbUser = (await _auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user!;
        if (fbUser != null && fbUser.emailVerified == true) {
          res = "success";
        } else {
          //E-postanın aktivasyon işlemleri kontrol ediliyor.
          res = 'Lütfen e-posta adresinizin aktivasyon işlemlerini tamamlayın.';
        }
      } else {
        res = "Lütfen tüm değerleri giriniz.";
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

  Future<String> updatePsikologUser({
    required String interestField,
    required String bio,
    required Uint8List? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (interestField.isNotEmpty && bio.isNotEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'interestField': interestField,
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else if (interestField.isNotEmpty && bio.isNotEmpty && file == null) {
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'interestField': interestField,
          'bio': bio,
        });
        res = "Kayıt Başarılı";
      } else if (interestField.isEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        await _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'profImage': photoUrl,
        });
        res = "Kayıt Başarılı";
      } else if (interestField.isNotEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'interestField': interestField,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else if (interestField.isEmpty && bio.isNotEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else {
        res = 'Lütfen tüm değerler girinz!';
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

  Future<String> updateAdminUser({
    required String username,
    required String bio,
    required Uint8List? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (username.isNotEmpty && bio.isNotEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'username': username,
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        if (_firestore
                .collection('posts')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .get() !=
            null) {}
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else if (username.isNotEmpty && bio.isNotEmpty && file == null) {
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'username': username,
          'bio': bio,
        });
        res = "Kayıt Başarılı";
      } else if (username.isEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore.collection('posts').doc().update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else if (username.isNotEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'username': username,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else if (username.isEmpty && bio.isNotEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        _firestore
            .collection('posts')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'profImage': photoUrl,
          },
        );
        res = "Kayıt Başarılı";
      } else {
        res = 'Lütfen tüm değerler girinz!';
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

  Future<String> updatePsikologUserConfirm({
    required String uid,
    required bool confirmation,
  }) async {
    String res = "Some error Occurred";
    try {
      await _firestore
          .collection("PsikologUsers")
          .doc(uid)
          .update({'confirmation': confirmation});
      res = "Kayıt Başarılı";
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
