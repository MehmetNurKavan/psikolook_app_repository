import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/change_email_password.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/partner/login/Login_home.dart';
import 'package:psikolook_anasayfa/widget/text_card.dart';

class UpdatPersonPage extends StatefulWidget {
  final String uid;
  const UpdatPersonPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<UpdatPersonPage> createState() => _UpdatPersonPageState();
}

class _UpdatPersonPageState extends State<UpdatPersonPage> {
  var userData = {};
  bool isChecked = false;
  bool isChecked2 = false;
  bool _isLoading = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
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

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _complaintController = TextEditingController();
  final _numberController = TextEditingController();
  final _password0Controller = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _jobController = TextEditingController();
  final _schoolNameController = TextEditingController();
  final _schoolJobController = TextEditingController();
  final _schoolClassController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _numberController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _jobController.dispose();
    _password0Controller.dispose();
    _complaintController.dispose();
    _schoolNameController.dispose();
    _schoolJobController.dispose();
    _schoolClassController.dispose();
  }

  void updateUserField(field, value) async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });
    // signup user using our authmethodds
    String res = await OtherAuthMethods().updateOtherUserField(
      field: field,
      value: value,
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
      Navigator.pop(context);
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  void deleteUser() async {
    try {
      await AuthMethods().deleteUser();
      await FirebaseFirestore.instance
          .collection('OtherUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginHomePage(),
          ),
          (route) => false);
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return const Text(
            'Hata!',
            style: TextStyle(color: Colors.red, fontSize: 40),
          );
        },
      );
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
    updateUserImage(_image);
  }

  void updateUserImage(file) async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });
    String res = await OtherAuthMethods().updateOtherUserImage(file: file);
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
/*     final fileName =
        file != null ? p.basename(file!.path) : 'Henüz dosya seçilemedi'; */
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: backGroundColor)),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      color: Colors.white, backgroundColor: Colors.black))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 15, right: 15.0, bottom: 25.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                                child: FloatingActionButton.small(
                                    elevation: 0,
                                    backgroundColor: Colors.black,
                                    child: const Icon(
                                      Icons.arrow_back_ios_new,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomePagePerson(uid: widget.uid),
                                          ));
                                    }),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Image.asset(
                                        "assets/images/logo_kucuk.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8)
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Stack(
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: MemoryImage(_image!),
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      )
                                    : userData['photoUrl'] != null &&
                                            userData['photoUrl'] != ''
                                        ? CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 64,
                                            backgroundImage: NetworkImage(
                                              userData['photoUrl'],
                                            ),
                                          )
                                        : const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 64,
                                            backgroundImage: AssetImage(
                                                'assets/images/default-usr.png'),
                                          ),
                                Positioned(
                                  bottom: -10,
                                  left: 80,
                                  child: IconButton(
                                    onPressed: selectImage,
                                    icon: const Icon(Icons.add_a_photo),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('e-posta-şifre',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    bottom: 5.0,
                                    top: 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Text(
                                            '${userData['email']}\n\n********* ')),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateUserEmailPassword(
                                                  uid: widget.uid),
                                        ));
                                      },
                                      child: const Text(
                                        'düzenle',
                                        style: TextStyle(color: blueColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Adınız Soyadınız',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                                describle: 'Kullanıcı Adı',
                                text: userData['username'] ?? '',
                                controller: _usernameController,
                                function: () {
                                  updateUserField(
                                    'username',
                                    _usernameController.text.trim(),
                                  );
                                  setState(() {
                                    getData();
                                  });
                                }),
                            /*SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(width: 10.0),
                          Text('E-Postanız',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['email']??'',
                          textEditingController: _emailController,
                          textInputType: TextInputType.emailAddress), */
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Yaş',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                                describle: 'Yaş',
                                text: userData['age'] ?? '',
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                function: () {
                                  updateUserField(
                                    'age',
                                    _ageController.text.trim(),
                                  );
                                  setState(() {
                                    getData();
                                  });
                                }),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Telefon',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                                describle: 'Telefon Numarası',
                                text: userData['number'],
                                controller: _numberController,
                                keyboardType: TextInputType.number,
                                function: () {
                                  updateUserField(
                                    'number',
                                    _numberController.text.trim(),
                                  );
                                  setState(() {
                                    getData();
                                  });
                                }),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Şikayetiniz(Kısaca açklayınız)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                              describle: 'Şikayet',
                              text: userData['complaint'] ?? '',
                              controller: _complaintController,
                              function: () {
                                updateUserField(
                                  'complaint',
                                  _complaintController.text.trim(),
                                );
                                setState(() {
                                  getData();
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Mesleğiniz',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                              describle: 'Mesleğiniz',
                              text: userData['job'] ?? '',
                              controller: _jobController,
                              function: () {
                                updateUserField(
                                  'job',
                                  _jobController.text.trim(),
                                );
                                setState(() {
                                  getData();
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Öğrenciyseniz Okulunuzun Okul Adı',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                              describle: 'Okul Adı',
                              text: userData['schoolName'] ?? '',
                              controller: _schoolNameController,
                              function: () {
                                updateUserField(
                                  'schoolName',
                                  _schoolNameController.text.trim(),
                                );
                                setState(() {
                                  getData();
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            //"Diplomanız ya da Öğrenci Belgeniz"
                            /* StorageMethods().uploadPdfToStorage('pdfs', _pdf, true); */
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Öğrenciyseniz Bölümünüz',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                              describle: 'Okuldaki Bölüm',
                              text: userData['schoolJob'] ?? '',
                              controller: _schoolJobController,
                              function: () {
                                updateUserField(
                                  'schoolJob',
                                  _schoolJobController.text.trim(),
                                );
                                setState(() {
                                  getData();
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10.0),
                                Text('Öğrenciyseniz Sınıfınız',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            UpdateCard(
                              describle: 'Sınıfınız',
                              text: userData['schoolClass'] ?? '',
                              controller: _schoolClassController,
                              function: () {
                                updateUserField(
                                  'schoolClass',
                                  _schoolClassController.text.trim(),
                                );
                                setState(() {
                                  getData();
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                                'Şu anda hesabınızı siliyorsunuz, emin misiniz?'),
                                            TextButton(
                                              child: const Text(
                                                'Hesabımı Sil',
                                                style: TextStyle(
                                                    color: pinkColor,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                              onPressed: () {
                                                deleteUser();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'Hesabımı Sil',
                                  style:
                                      TextStyle(fontSize: 21, color: blueColor),
                                )),
                            /* Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(width: 10.0),
                          Text('Şifreniz',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                color: Colors.black,
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintText: "********",
                            filled: true,
                            fillColor: Colors.white),
                      ), */
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
