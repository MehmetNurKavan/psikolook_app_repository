import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/login/firstPage.dart';
import 'package:psikolook_anasayfa/view/partner/login/onay_bekleme_ekran%C4%B1.dart';
import 'package:psikolook_anasayfa/widget/tryagain.dart';

class DiferentPlatformLayout extends StatefulWidget {
  final Widget psikologUserScreen;
  final Widget otherUserScreen;
  final Widget adminUserScreen;
  const DiferentPlatformLayout({
    Key? key,
    required this.psikologUserScreen,
    required this.otherUserScreen,
    required this.adminUserScreen,
  }) : super(key: key);

  @override
  State<DiferentPlatformLayout> createState() => _DiferentPlatformLayoutState();
}

class _DiferentPlatformLayoutState extends State<DiferentPlatformLayout> {
  var psikologUserData = {};
  var otherUserData = {};
  bool isPsikolog = false;
  bool isOther = false;

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (userSnap.exists) {
        setState(() {
          isPsikolog = true;
        });
        psikologUserData = userSnap.data()!;
      } else {
        var userSnap2 = await FirebaseFirestore.instance
            .collection('OtherUsers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        if (userSnap2.exists) {
          setState(() {
            isOther = true;
          });
          otherUserData = userSnap2.data()!;
        }
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  selectedUserPlatform() {
    if (isOther = true) {
      if (otherUserData['userContract'] == true) {
        return widget.psikologUserScreen;
      } else {
        return widget.psikologUserScreen;
      }
    } else if (isPsikolog == true) {
      if (psikologUserData['email'] == 'psikolookdevelopment@gmail.com') {
        return widget.adminUserScreen;
      } else if (psikologUserData['confirmation'] == true) {
        return widget.psikologUserScreen;
      } else if (psikologUserData['confirmation'] == false) {
        return const OnayBeklemeEkrani();
      } else {
        const TryAgainPage();
      }
    } else {
      return const FirstPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectedUserPlatform();
  }
}
