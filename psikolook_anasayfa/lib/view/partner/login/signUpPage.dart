import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/kvkk_page.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/user_contrant.dart';
import 'package:psikolook_anasayfa/view/partner/login/Login_home.dart';
import 'package:psikolook_anasayfa/view/partner/login/help_me_.page.dart';
import 'package:psikolook_anasayfa/widget/text_field_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;
  bool _obscureText = true;
  bool isNeedHelp = false;
/*   UploadTask? task;
  File? file;
 */
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _password0Controller = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _schoolJobController = TextEditingController();
  final TextEditingController _schoolClassController = TextEditingController();
  bool kvkk = false;
  bool userContract = false;
  Uint8List? _image;
  Uint8List? _castawayFile;

  @override
  void initState() {
    super.initState();
  }

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

  unfocus() {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void signUpUser() async {
    unfocus();
    setState(() {
      _isLoading = true;
      showLoaderDialog(context);
    });
    if (kvkk == true && userContract == true) {
      // signup user using our authmethodds
      String res = await OtherAuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        file: _image,
        number: _numberController.text,
        age: _ageController.text,
        gender: _genderController.text,
        schoolName: _schoolNameController.text,
        complaint: _complaintController.text,
        job: _jobController.text,
        schoolClass: _schoolClassController.text,
        schoolJob: _schoolJobController.text,
        kvkk: kvkk,
        userContract: userContract,
        castawayFile: _castawayFile,
      );
      // if string returned is sucess, user has been created
      if (res ==
          "Kayıt Başarılı, E-posta adresinize aktivasyon maili gönderildi. Lütfen aktivasyon işlemini tamamlayıp giriş yapınız.") {
        setState(() {
          _isLoading = false;
          showSnackBar(context, res);
          // navigate to the home screen
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LoginHomePage(),
              ),
              (route) => false);
          //kayıt oldugunda otomatik giriş yapmasın diye çıkış da yapiyoruz
          FirebaseAuth.instance.signOut();
        });
      } else {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pop();
          showSnackBar(context, res);
        });
        // show the error
      }
    } else {
      Navigator.of(context).pop();
      showSnackBar(context,
          'Lütfen Kvkk veya Kullanıcı Sözleşmelerini okuyup onayladıktan sonra kayıt yapınız');
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
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                  backgroundColor: Colors.transparent,
                                )
                              : CircleAvatar(
                                  radius: 64,
                                  backgroundColor: Colors.white,
                                  child: SizedBox(
                                    height: 95,
                                    child: Image.asset(
                                        'assets/images/default-usr.png'),
                                  ),
                                  //AssetImage('assets/images/default-usr.png',),
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
                        hintText: "Adınız Soyadınız",
                        textInputType: TextInputType.name,
                        textEditingController: _usernameController,
                      ),
                      
                      SizedBox(
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
                          hintText: "E-Posta",
                          textEditingController: _emailController,
                          textInputType: TextInputType.emailAddress),
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
                          hintText: "Yaş",
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
                          hintText: 'Cinsiyetniz',
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
                        decoration: const InputDecoration(
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+90'),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Telefonunuzu Giriniz",
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
                          hintText:
                              "Neden psikolojik destek almak istiyorsunuz?.",
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
                          hintText:
                              "Mesleğiniz Varsa Giriniz Yoksa Yok Yazınız",
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
                          hintText: "Okuduğunuz Okul Adını Giriniz",
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
                          hintText: "Okuduğunuz Bölümü Giriniz",
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
                          hintText: "Okuduğunuz Sınıfı Giriniz",
                          textInputType: TextInputType.name,
                          textEditingController: _schoolClassController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                          Row(
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
                            hintText: "Şifrenizi Giriniz",
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () async {
                                final castawayResult = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HelpMePage()),
                                );
                                setState(() {
                                  _castawayFile = castawayResult;
                                });
                              },
                              child: const Text(
                                "Ücretsiz Destek Alamak İstiyorum",
                                style: TextStyle(
                                  color: Colors.pink,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                              _castawayFile == null
                              ? Container()
                              : const Icon(Icons.file_download_done,
                                  size: 34, color: pinkColor),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      bool data = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KvkkPage()));
                                      kvkk = data;
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          "KVKK",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        Text("'yı okudum onaylıyorum",
                                            style: TextStyle(
                                              color: Colors.pink,
                                            )),
                                      ],
                                    )),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Card(
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      checkColor: Colors.pink,
                                      activeColor: Colors.pink,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.white),
                                      value: kvkk,
                                      onChanged: (bool? value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      bool data = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UserContrat()));
                                      userContract = data;
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Kullanıcı Sözleşmesi",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        Text("ni okudum kabul ediyorum",
                                            style: TextStyle(
                                              color: Colors.pink,
                                            )),
                                      ],
                                    )),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Card(
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      checkColor: Colors.pink,
                                      activeColor: Colors.pink,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.white),
                                      value: userContract,
                                      onChanged: (bool? value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 50),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            onPressed: signUpUser,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 13, bottom: 13),
                                child: Text("Kayıt Ol")),
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

/*   Future selectedFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf']);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }

  Future upLoadFile() async {
    if (file == null) return;
    final fileName = p.basename(file!.path);
    final destination = 'pdf/$fileName';
    task = StorageMethods.uploadFile(destination, file!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(
      () {},
    );
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(0);
            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      ); */

  /*  gender(selectedGender) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                    selectedGender = "Kadın";
                  });
                }),
            const Text("Kadın"),
            const Icon(Icons.female)
          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                    selectedGender = "Erkek";
                  });
                }),
            const Text("Erkek"),
            const Icon(Icons.male)
          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                    selectedGender = "Diğer";
                  });
                }),
            const Text("Diğer"),
            const Icon(Icons.transgender)
          ],
        )
      ],
    );
  } */
}
