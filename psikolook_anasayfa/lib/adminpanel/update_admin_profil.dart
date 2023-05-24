import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/adminpanel/admin_panel.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class UpdateAdminProfil extends StatefulWidget {
  final String uid;
  const UpdateAdminProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<UpdateAdminProfil> createState() => _UpdateAdminProfilState();
}

class _UpdateAdminProfilState extends State<UpdateAdminProfil> {
  String dateDay0 = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  var userData = {};
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(widget.uid)
          .get();

      // get blog lENGTH
      var blogSnap = await FirebaseFirestore.instance
          .collection('blogs')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      blogLen = blogSnap.docs.length;
      postLen = postSnap.docs.length;

      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bioController.dispose();
    _nameController.dispose();
  }

  _bioField() {
    if (userData['bio'].toString() == '' ||
        userData['bio'].toString() == 'null') {
      return 'Buraya Biyografinizi Yazınız';
    } else {
      return userData['bio'];
    }
  }

  _nameField() {
    if (userData['username'].toString() == '' ||
        userData['username'].toString() == 'null') {
      return 'Buraya Admin Adınızı Yazınız';
    } else {
      return userData['username'];
      ;
    }
  }

  _onPressed() {
    String _bio = userData['bio'];
    String _name = userData['username'];
    if (_bioController.text != _bio && _nameController.text == '') {
      updateUser(_bioController.text.trim(), _name);
    } else if (_nameController.text != _name && _bioController.text == '') {
      updateUser(_bio, _nameController.text.trim());
    } else {
      updateUser(_bioController.text.trim(), _nameController.text.trim());
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AdminPanel()));
  }

  void updateUser(String bio, String name) async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().updateAdminUser(
      username: name,
      bio: bio,
      file: _image,
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Colors.white,
                                        size: 30)),
                                Stack(
                                  children: [
                                    _image != null
                                        ? CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                                MemoryImage(_image!),
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          )
                                        : CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 64,
                                            backgroundImage: NetworkImage(
                                                userData['photoUrl'] ?? '')),
                                    Positioned(
                                      bottom: -10,
                                      left: 80,
                                      child: IconButton(
                                        onPressed: selectImage,
                                        icon: const Icon(Icons.add_a_photo,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        userData['username'],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '$followers',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'TAKİPÇİLER',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$postLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'PAYLAŞIMLAR',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$blogLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'BLOG YAZILARI',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              color: Colors.white54,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.05,
                              thickness: 0.9,
                              indent: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text('Admin Adını Düzenleyiniz:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: _nameController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.none,
                                    minLines: 3,
                                    maxLines: null,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: _nameField().toString(),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text('Biyografinizi Düzenleyiniz:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: _bioController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.none,
                                    minLines: 3,
                                    maxLines: null,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: _bioField().toString(),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                ),
                              ),
                              onPressed: _onPressed,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 70.0,
                                    right: 70.0,
                                    bottom: 10,
                                    top: 10),
                                child: Text(
                                  'Kaydet',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
