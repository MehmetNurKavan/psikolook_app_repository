import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/otherUser/providers/other_user_provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/login/firstPage.dart';
import 'package:psikolook_anasayfa/view/home/login/onay_bekleme_ekran%C4%B1.dart';

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
  @override
  void initState() {
    super.initState();
    addData();
    addData2();
    getData();
  }

  var userData = {};
  addData() async {
    PsikologUserProvider userProvider =
        Provider.of<PsikologUserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  addData2() async {
    OtherUserProvider otherUserProvider =
        Provider.of<OtherUserProvider>(context, listen: false);
    await otherUserProvider.refreshUser();
  }

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  selectedUserPlatform() {
    if (userData['email'] == 'psikolookdevelopment@gmail.com') {
      CollectionReference users =
          FirebaseFirestore.instance.collection('PsikologUsers');
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
                body: Center(child: Text("Something went wrong")));
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return selectedUserPlatform2();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return widget.adminUserScreen;
          }
          return const sayfa();
        },
      );
    }
    CollectionReference users =
        FirebaseFirestore.instance.collection('PsikologUsers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text("Something went wrong")));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return selectedUserPlatform2();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (userData['confirmation'] == true) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return widget.psikologUserScreen;
          } else {
            return const OnayBeklemeEkrani();
          }
        }
        return const sayfa();
      },
    );
  }

  selectedUserPlatform2() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('PsikologUsers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text("Something went wrong")));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return selectedUserPlatform3();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return widget.psikologUserScreen;
        }
        return const sayfa();
      },
    );
  }

  selectedUserPlatform3() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('OtherUsers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text("Something went wrong")));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return selectedUserPlatform();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return widget.otherUserScreen;
        }
        return const sayfa();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return selectedUserPlatform();
  }
}
