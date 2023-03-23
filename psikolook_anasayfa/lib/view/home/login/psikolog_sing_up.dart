import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikolook_anasayfa/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/drawer/kvkk_page.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'package:psikolook_anasayfa/widget/text_field_input.dart';

class psikologSignUpPage extends StatefulWidget {
  const psikologSignUpPage({Key? key}) : super(key: key);

  @override
  State<psikologSignUpPage> createState() => _psikologSignUpPageState();
}

class _psikologSignUpPageState extends State<psikologSignUpPage> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool _isLoading = false;
  bool _obscureText = true;
/*   UploadTask? task;
  File? file;
 */
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _institutionNameController =
      TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
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
    _schoolNameController.dispose();
    _institutionNameController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: '',
      file: _image!,
      number: _numberController.text,
      age: _ageController.text,
      gender: _genderController.text,
      schoolName: _schoolNameController.text,
      degree: _degreeController.text,
      institutionName: _institutionNameController.text,
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const psikolog_page()),
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
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Adınız Soyadınız',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                        hintText: "Adınız Soyadınız",
                        textInputType: TextInputType.name,
                        textEditingController: _usernameController,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('E-Postanız',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: "E-Posta",
                          textEditingController: _emailController,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Yaş',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: "Yaş",
                          textInputType: TextInputType.number,
                          textEditingController: _ageController),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Cinsiyetiniz",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      /*  gender(_genderController.text), */
                      TextFieldInput(
                          hintText: 'Cinsiyetniz',
                          textEditingController: _genderController,
                          textInputType: TextInputType.text),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Telefon',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: 'Telefonunuzu Giriniz',
                          textEditingController: _numberController,
                          textInputType: TextInputType.number),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Şifreniz',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const[
                          SizedBox(width: 10.0),
                          Text(
                              'Yüksek Lisans veya Doktora Öğrencisiyseniz \nOkulunuzun Adı',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: "Okulunuzun Adını Giriniz",
                          textInputType: TextInputType.name,
                          textEditingController: _schoolNameController),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const[
                          SizedBox(width: 10.0),
                          Text('Çalışıyorsanız Çalıştığınız Kurum',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: "Kurum Adını Giriniz",
                          textEditingController: _institutionNameController,
                          textInputType: TextInputType.name),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Ünvanınız',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextFieldInput(
                          hintText: "Unvanınızı Giriniz",
                          textInputType: TextInputType.name,
                          textEditingController: _degreeController),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      //"Diplomanız ya da Öğrenci Belgeniz"
                      /* StorageMethods().uploadPdfToStorage('pdfs', _pdf, true); */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10.0),
                          const Text('Diplomanız ya da Öğrenci Belgeniz',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      /* Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(1),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ))),
                                onPressed: selectedFile,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 5.0, bottom: 5),
                                  child: Text(
                                    "Belgenizi Seçiniz",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(1),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ))),
                                onPressed: upLoadFile,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 5.0, bottom: 5),
                                  child: Text(
                                    "Belgeyi Onayla",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          task != null ? buildUploadStatus(task!) : Container(), */
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Belgeniz onaylandığında ana sayfanızda \n  profiliniz onaylandı yazacaktır",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KvkkPage()));
                                    },
                                    child: Row(
                                      children: [
                                        const Text(
                                          "KVKK",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        const Text("'yı okudum onaylıyorum",
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
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Kullanıcı Sözleşmesi",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        const Text("ni okudum kabul ediyorum",
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
                                      value: isChecked2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked2 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
