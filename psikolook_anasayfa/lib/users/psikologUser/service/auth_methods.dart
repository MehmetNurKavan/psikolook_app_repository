import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/psikolog_user.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/storage_methods.dart';
import 'package:psikolook_anasayfa/users/services/auth_exception.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*  // get user details
 //! null chach operator null value yuzunden kaldırdık
  Future<PsikologUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('PsikologUsers').doc(currentUser.uid).get();

    return PsikologUser.fromSnap(documentSnapshot);
  } */

  // Signing Up User

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      String? bio,
      required List<String> interestField,
      required Uint8List? file,
      required String number,
      required int age,
      required String gender,
      required String? schoolName,
      required String degree,
      required String? institutionName,
      required bool kvkk,
      required bool userContract,
      required Uint8List? pdfFile}) async {
    String res = "Bir hata ile karşılaşıldı!";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          number.isNotEmpty &&
          age.toString().isNotEmpty &&
          degree.isNotEmpty &&
          interestField.isNotEmpty &&
          gender.isNotEmpty &&
          pdfFile != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //e-posta adresinde herhangi bir hata yoksa kimlik doğrulaması için e-posta gönderir.
        cred.user!.sendEmailVerification();
        String photoUrl = "";
        if (file == null || file.isEmpty) {
        } else {
          photoUrl = await StorageMethods()
              .uploadImageToStorage('profilePics', file, false);
        }
        String pdfUrl = await StorageMethods().upLoadPdftoStorage(pdfFile);
        PsikologUser user = PsikologUser(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio ?? '',
          interestField: interestField,
          followers: [],
          age: age,
          gender: gender,
          number: number,
          schoolName: schoolName ?? '',
          degree: degree,
          institutionName: institutionName ?? '',
          kvkk: kvkk,
          userContract: userContract,
          confirmation: false,
          pdfUrl: pdfUrl,
          nickname: '',
          ibanValue: '',
          moneyValue: '',
          seansDkkValue: '',
        );
        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(cred.user!.uid)
            .set(user.toJson());
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

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Bir hata oluştu";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
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
    } on FirebaseAuthException catch (e) {
      firebaseException(res, e);
    }
    return res;
  }

  // logging in user
  //!
  Future<String> changeUser({
    required String email,
    required String password,
    required String newemail,
  }) async {
    String res = "Bir hata oluştu";
    try {
      if (email.isNotEmpty && password.isNotEmpty && newemail.isNotEmpty) {
        signOut();
        User? fbUser = (await _auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
        if (fbUser != null && fbUser.emailVerified == true) {
          res = "success";
          signOut();
          await _auth.createUserWithEmailAndPassword(
              email: newemail, password: password);
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: newemail, password: password);
          //e-posta adresinde herhangi bir hata yoksa kimlik doğrulaması için e-posta gönderir.
          cred.user!.sendEmailVerification();
          signOut();
          User? fbUser2 = (await _auth.signInWithEmailAndPassword(
                  email: newemail, password: password))
              .user;
          /* await _auth.currentUser!.updateEmail(newemail); //gerekyok */
          if (fbUser2!.emailVerified == true) {
            await _firestore
                .collection('otherUsers')
                .doc(_auth.currentUser!.uid)
                .update({'email': newemail});
            await fbUser.delete();
          } else {
            res = 'bekleniliyor';
            Future.delayed(const Duration(minutes: 2), () {
              signOut();
              _auth.signInWithEmailAndPassword(
                  email: email, password: password);
            });
            await fbUser2.delete();
          }
        } else {
          //E-postanın aktivasyon işlemleri kontrol ediliyor.
          res = 'Lütfen e-posta adresinizin aktivasyon işlemlerini tamamlayın.';
        }
      } else {
        res = "Lütfen tüm değerleri giriniz.";
      }
    } on FirebaseAuthException catch (e) {
      firebaseException(res, e);
    }
    return res;
  }

  //!
  Future<String> changeUser2({
    required String email,
    required String password,
    required String newemail,
  }) async {
    String res = "Bir hata oluştu";
    try {
      if (email.isNotEmpty && password.isNotEmpty && newemail.isNotEmpty) {
        User? fbUser = _auth.currentUser;
        if (fbUser != null) {
          // Mevcut kullanıcının kimlik bilgilerini doğrula
          AuthCredential credential =
              EmailAuthProvider.credential(email: email, password: password);
          UserCredential authResult =
              await fbUser.reauthenticateWithCredential(credential);

          // E-posta onaylama işlemi
          if (authResult.user != null) {
            await authResult.user!.updateEmail(newemail);
            await authResult.user!.sendEmailVerification();

            // Yeni e-posta adresini firestore'de güncelle
            await _firestore
                .collection('otherUsers')
                .doc(authResult.user!.uid)
                .update({'email': newemail});

            res = "success";
          } else {
            res = 'Kimlik doğrulama başarısız oldu.';
          }
        } else {
          res = 'Oturum açan bir kullanıcı bulunamadı.';
        }
      } else {
        res = "Lütfen tüm değerleri giriniz.";
      }
    } on FirebaseAuthException catch (e) {
      firebaseException(res, e);
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    await _auth.currentUser!.delete();
  }

  Future<String?> forgotPassword(String email) async {
    String? res;
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) => value);
      res = 'e-posta adresinizi kontrol ediniz';
    } on FirebaseAuthException catch (e) {
      res = firebaseException(res, e);
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updatePsikologUser({
    List<String>? interestField,
    String? bio,
    Uint8List? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (interestField != null && bio != null && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'interestField': interestField,
          'bio': bio,
          'photoUrl': photoUrl,
        });
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      } else if (interestField != null && bio != null && file == null) {
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'interestField': interestField,
          'bio': bio,
        });
        res = "Kayıt Başarılı";
      } else if (interestField == null && bio == null && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      } else if (interestField != null && bio == null && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'interestField': interestField,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      } else if (interestField == null && bio != null && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      }
      if (interestField == null && bio != null && file == null) {
        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'bio': bio,
        });
        res = "Kayıt Başarılı";
      }
      if (interestField != null && bio == null && file == null) {
        // adding user in our database
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'interestField': interestField,
        });
        res = "Kayıt Başarılı";
      } else {
        res = 'Lütfen tüm değerler girinz!';
      }
    } on FirebaseAuthException catch (e) {
      firebaseException(res, e);
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
            .doc(_auth.currentUser!.uid)
            .update({
          'username': username,
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl, 'username': username});
          });
        });
        res = "Kayıt Başarılı";
      } else if (username.isNotEmpty && bio.isNotEmpty && file == null) {
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'username': username,
          'bio': bio,
        });
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'username': username});
          });
        });
        res = "Kayıt Başarılı";
      } else if (username.isEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      } else if (username.isNotEmpty && bio.isEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'username': username,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl, 'username': username});
          });
        });
        res = "Kayıt Başarılı";
      } else if (username.isEmpty && bio.isNotEmpty && file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
            .update({
          'bio': bio,
          'photoUrl': photoUrl,
        });
        //post için profil url ve isim değisimi
        await _firestore
            .collection('posts')
            .where('uid', isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'profImage': photoUrl});
          });
        });
        res = "Kayıt Başarılı";
      } else {
        res = 'Lütfen tüm değerler girinz!';
      }
    } on FirebaseAuthException catch (e) {
      res = firebaseException(res, e);
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
      res = firebaseException(res, e);
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateNickNamePsikologUser({
    required String nickname,
  }) async {
    String res = "Some error Occurred";
    try {
      if (nickname.isNotEmpty) {
        await _firestore
            .collection("PsikologUsers")
            .doc(_auth.currentUser!.uid)
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
}
