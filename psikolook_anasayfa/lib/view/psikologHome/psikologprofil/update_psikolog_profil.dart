import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePsikologProfil extends StatefulWidget {
  final String uid;
  const UpdatePsikologProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<UpdatePsikologProfil> createState() => _UpdatePsikologProfilState();
}

class _UpdatePsikologProfilState extends State<UpdatePsikologProfil> {
  TextEditingController dateController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  var userData = {};
  bool _isLoading = false;
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
  bool isLoading = false;
  Uint8List? _image;
  bool isVisible = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(widget.uid)
          .get();
      var blogSnap = await FirebaseFirestore.instance
          .collection('blogs')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
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
      isLoading = false;
    });
  }

  _bioField() {
    if (userData['bio'].toString() == '' ||
        userData['bio'].toString() == 'null') {
      return 'Buraya Biyografinizi Yazınız';
    } else {
      return userData['bio'];
    }
  }

  _onPressed() {
    showLoaderDialog(context);
    String _bio = userData['bio'];
    if (bioController.text != _bio && bioController.text!='' &&
        interestFieldValues.toString() != '[]') {
      updateUser(bioController.text.trim(), interestFieldValues);
    } else if (interestFieldValues.toString() != '[]' &&
        (bioController.text == '' || bioController.text == _bio)){
      updateUser(null, interestFieldValues);
    }else if (interestFieldValues.toString() == '[]' &&
        (bioController.text != '' && bioController.text != _bio)){
      updateUser(bioController.text, null);
    } 
    else {
      updateUser(null, null);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PsikologHome()));
  }

  void updateUser(String? bio, List<String>? interestField) async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().updatePsikologUser(
      interestField: interestField,
      bio: bio,
      file: _image,
    );
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    showSnackBar(context, res);
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  List<String> interestFieldValues=[];

  bool? _popupBuilderSelection = false;
  bool? _popupBuilderSelection2 = false;

  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey2 = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      _popupBuilderSelection = selectedItem.isEmpty ? false : null;
      if (updateState) {
        setState(() {});
      }
    }

    _handleCheckBoxState(updateState: false);

    void _handleCheckBoxState2({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey2.currentState?.popupGetSelectedItems ?? [];
      _popupBuilderSelection2 = selectedItem.isEmpty ? false : null;
      if (updateState) {
        setState(() {});
      }
    }

    _handleCheckBoxState2(updateState: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: isLoading
            ? Center(
                child: circleLoading(),
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
                                borderRadius: BorderRadius.circular(11.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text('BİYOGRAFİNİZ:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: bioController,
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
                          !isVisible
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(11.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: userData['interestField']
                                                          .toString() ==
                                                      '[]' ||
                                                  userData['interestField'] ==
                                                      null ||
                                                  userData['interestField']
                                                          .toString() ==
                                                      'null'
                                              ? const Text(
                                                  'Lütfen düzenleye tıklayıp ilgilendiğiniz alanı yazınız!')
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      userData['interestField']
                                                          .length,
                                                  primary: false,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Card(
                                                        color: colorsInterstField[index >=
                                                                colorsInterstField
                                                                    .length
                                                            ? index -
                                                                colorsInterstField
                                                                    .length
                                                            : index],
                                                        elevation: 0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  bottom: 8.0,
                                                                  left: 30.0,
                                                                  right: 30.0),
                                                          child: Text(userData[
                                                                  'interestField']
                                                              [index]),
                                                        ));
                                                  },
                                                ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isVisible = true;
                                              });
                                            },
                                            child: const Text(
                                                'İlgi Alanlarınızı Değiştirin',
                                                style: TextStyle(
                                                    color: blueColor,
                                                    decoration: TextDecoration
                                                        .underline)))
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(11.0)),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: DropdownSearch<
                                                String>.multiSelection(
                                              onChanged: (value) {
                                                setState(() {
                                                  interestFieldValues =
                                                      List.from(value);
                                                });
                                              },
                                              dropdownButtonProps:
                                                  const DropdownButtonProps(
                                                      color: pinkColor),
                                              dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                      dropdownSearchDecoration:
                                                          InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              hintText:
                                                                  'İlgi Alanlarınız',
                                                              border:
                                                                  InputBorder
                                                                      .none)),
                                              key: _popupBuilderKey,
                                              items: ilgiAlani,
                                              popupProps:
                                                  PopupPropsMultiSelection
                                                      .modalBottomSheet(
                                                onItemAdded: (l, s) =>
                                                    _handleCheckBoxState2(),
                                                onItemRemoved: (l, s) =>
                                                    _handleCheckBoxState2(),
                                                showSearchBox: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisible = false;
                                              interestFieldValues = [];
                                            });
                                          },
                                          child: const Text('iptal',
                                              style: TextStyle(
                                                  color: blueColor,
                                                  decoration: TextDecoration
                                                      .underline)))
                                    ],
                                  ),
                                ),
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
