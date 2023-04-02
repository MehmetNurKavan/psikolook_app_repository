import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/profil/person_page.dart';
import 'package:psikolook_anasayfa/widget/text_field_input.dart';

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
  bool _obscureText = true;
  bool isLoading = false;
/*   UploadTask? task;
  File? file;
 */
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

  void updateUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await OtherAuthMethods().updateOtherUser(
      username: _usernameController.text.trim(),
      file: _image!,
      number: '90'.toString() + _numberController.text.trim(),
      age: _ageController.text.trim(),
      gender: _genderController.text.trim(),
      schoolName: _schoolNameController.text.trim(),
      complaint: _complaintController.text.trim(),
      job: _jobController.text.trim(),
      schoolClass: _schoolClassController.text.trim(),
      schoolJob: _schoolJobController.text.trim(),
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  HomePagePerson(uid: FirebaseAuth.instance.currentUser!.uid)),
          (route) => false);
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
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
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
          child: SingleChildScrollView(
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
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: FloatingActionButton.small(
                              elevation: 0,
                              backgroundColor: Colors.black,
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
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
                                  backgroundColor: Colors.grey,
                                  backgroundImage: MemoryImage(_image!),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.15,
                                )
                              : CircleAvatar(
                                  radius: 64,
                                  backgroundImage:
                                      NetworkImage(userData['photoUrl'] ?? '')),
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
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                        hintText: userData['username'] ?? '',
                        textInputType: TextInputType.name,
                        textEditingController: _usernameController,
                      ),
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
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['age'] ?? '',
                          textInputType: TextInputType.number,
                          textEditingController: _ageController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Cinsiyetiniz",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      /*  gender(_genderController.text), */
                      TextFieldInput(
                          hintText: userData['gender'] ?? '',
                          textEditingController: _genderController,
                          textInputType: TextInputType.text),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextField(
                        controller: _numberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          prefix: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+90'),
                          ),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: userData['number'] ?? '',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['complaint'] ?? '',
                          textInputType: TextInputType.name,
                          textEditingController: _complaintController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['job'] ?? '',
                          textEditingController: _jobController,
                          textInputType: TextInputType.name),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['schoolName'] ?? '',
                          textInputType: TextInputType.name,
                          textEditingController: _schoolNameController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['schoolJob'] ?? '',
                          textInputType: TextInputType.name,
                          textEditingController: _schoolJobController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: userData['schoolClass'] ?? '',
                          textInputType: TextInputType.name,
                          textEditingController: _schoolClassController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          !_isLoading
                              ? Container()
                              : const CircularProgressIndicator(),
                          const SizedBox(width: 50),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            onPressed: updateUser,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 13, bottom: 13),
                                child: Text("Güncelle")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
