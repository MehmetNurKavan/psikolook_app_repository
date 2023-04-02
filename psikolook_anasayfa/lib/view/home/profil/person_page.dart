import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/profil/update_person.dart';

class HomePagePerson extends StatefulWidget {
  final String uid;
  const HomePagePerson({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePagePerson> createState() => _HomePagePersonState();
}

class _HomePagePersonState extends State<HomePagePerson> {
  TextEditingController dateController = TextEditingController();

  var userData = {};
  bool isLoading = false;

  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    getData();
    dateController.text = "";
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('OtherUsers')
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black87),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: const AssetImage(
                                    'assets/images/default-usr.png'),
                                radius:
                                    MediaQuery.of(context).size.width * 0.15,
                              )
                            : CircleAvatar(
                                radius: 64,
                                child: CircleAvatar(
                                  radius: 64,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      NetworkImage(userData['photoUrl'] ?? ''),
                                ),
                              ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatPersonPage(
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid)));
                        },
                        icon: const Icon(Icons.more_horiz))
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Text(
                      userData['username'] ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  flex: 7,
                  child: ListView(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Telefon :'),
                            title: Text(userData['number'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('E-posta :'),
                            title: Text(userData['email'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Yaş :'),
                            title: Text(userData['age'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Cinsiyet :'),
                            title: Text(userData['gender'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Meslek :'),
                            title: Text(userData['job'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Okul :'),
                            title: Text(userData['schoolName'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Bölüm :'),
                            title: Text(userData['schoolJob'] ?? ''),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text('Sınıf :'),
                            title: Text(userData['schoolClass'] ?? ''),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
