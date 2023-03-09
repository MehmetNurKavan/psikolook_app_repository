/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/service/auth_service.dart';
import 'package:psikolook_anasayfa/view/home/drawer/kvkk_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _value = 1;
  bool isChecked = false;
  bool isChecked2 = false;
  bool _obscureText0 = true;
  //final formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
/*   final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController0 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _schoolClassController = TextEditingController();
  final TextEditingController _schoolJobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController(); */
  late String fullName, email, number, password0;
/*       password1,
      age,
      gender,
      complaint,
      job,
      schoolName,
      schoolJob,
      schoolClass; */
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 255, 235, 240),
                Color.fromARGB(255, 255, 243, 244),
                Color.fromARGB(255, 255, 249, 246),
                Color.fromARGB(255, 255, 254, 248),
                Color.fromARGB(255, 255, 254, 248),
              ])),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 15, right: 15.0, bottom: 25.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 10,
                    ),
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
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      buildSignUpView(
                        "Adınız Soyadınız",
                        TextInputType.name,
                        fullName,
                      ),
                      buildSignUpView(
                          "E-Posta", TextInputType.emailAddress, email),
                      //buildSignUpView("Yaş", TextInputType.number, age),
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
                     /* buildGender(),
                      buildSignUpView(
                          "Şikayetiniz", TextInputType.name, complaint),
                      buildSignUpView("Mesleğiniz", TextInputType.name, job),
                      buildSignUpView("Telefon", TextInputType.number, number),
                      buildSignUpStudentView(
                          "Öğrenciyseniz Okuduğunuz Okulun Adı",
                          TextInputType.name,
                          schoolName),
                      buildSignUpStudentView("Öğrenciyseniz Bölümünüz",
                          TextInputType.name, schoolJob),
                      buildSignUpStudentView("Öğrenciyseniz Sınıfınız",
                          TextInputType.number, schoolClass),*/
                      buildPassword(
                          "Şifreniz", TextInputType.visiblePassword, password0),
                      /* buildPassword("Şifrenizi Tekrar Giriniz",
                          TextInputType.visiblePassword, password1), */
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          children: [
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
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            onPressed: signUp,
                            /*() {
                              _authService
                                  .createPerson(
                                _fullNameController.text,
                                _emailController.text,
                                _numberController.text,
                                _passwordController0.text,
                                _passwordController1.text,
                                _ageController.text,
                                _genderController.text,
                                _complaintController.text,
                                _jobController.text,
                                _schoolNameController.text,
                                _schoolJobController.text,
                                _schoolClassController.text,
                              )
                                  .then((value) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              }); 
                            },*/
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 13, bottom: 13),
                              child: Text("Kayıt Ol"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signUp(
          fullName,
          email,
          number,
          password0,
          /* password1,
          age,
          gender,
          complaint,
          job,
          schoolName,
          schoolJob,
          schoolClass, */
          );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => homePage()),
          (route) => false);
    } else {}
  }

  Column buildSignUpView(value, _kytp, val) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10.0),
            Text(value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Bilgileri Eksiksiz Doldurunuz";
            } else {}
          },
          onSaved: (value) {
            val = value!;
          },
          //controller: val,
          keyboardType: _kytp,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: value,
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Column buildSignUpStudentView(value, _kytp, val) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10.0),
            Text(value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onSaved: (value) {
            val = value!;
          },
          //controller: val,
          keyboardType: _kytp,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: value,
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  /* buildGender() {
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
                    gender = "Kadın";
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
                    gender = "Erkek";
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
                    gender = "Diğer";
                  });
                }),
            const Text("Diğer"),
            const Icon(Icons.transgender)
          ],
        )
      ],
    );
  } */

  buildPassword(value, _kytp, password) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10.0),
            Text(value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Bilgileri Eksiksiz Doldurunuz";
            } else {}
          },
          onSaved: (value) {
            password = value!;
          },
          obscureText: _obscureText0,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText0 = !_obscureText0;
                    });
                  },
                  color: Colors.black,
                  icon: Icon(
                      _obscureText0 ? Icons.visibility : Icons.visibility_off)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: value,
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
 */
// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:psikolook_anasayfa/gecici/product/common/signup_widget.dart';
import 'package:psikolook_anasayfa/gecici/services/firebase_exceptions.dart';
import 'package:psikolook_anasayfa/gecici/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final auth = FirebaseAuthProvider();
  final String _errorMessage = 'Birşeyler ters gitti :/';
  String email = '';
  String password = '';
  String fullName = '';
  String number = '';
  String age = '';
  String gender = '';
  String complaint = '';
  String job = '';
  String schoolName = '';
  String schoolClass = '';
  String schoolJob = '';

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _numberController;
  late final TextEditingController _password0Controller;
  late final TextEditingController _password1Controller;
  late final TextEditingController _ageController;
  late final TextEditingController _genderController;
  late final TextEditingController _complaintController;
  late final TextEditingController _jobController;
  late final TextEditingController _schoolNameController;
  late final TextEditingController _schoolJobController;
  late final TextEditingController _schoolClassController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fullNameController = TextEditingController();
    _numberController = TextEditingController();
    _password0Controller = TextEditingController();
    _password1Controller = TextEditingController();
    _ageController = TextEditingController();
    _genderController = TextEditingController();
    _complaintController = TextEditingController();
    _jobController = TextEditingController();
    _schoolNameController = TextEditingController();
    _schoolJobController = TextEditingController();
    _schoolClassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _numberController.dispose();
    _password0Controller.dispose();
    _password1Controller.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _complaintController.dispose();
    _jobController.dispose();
    _schoolNameController.dispose();
    _schoolJobController.dispose();
    _schoolClassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 255, 235, 240),
            Color.fromARGB(255, 255, 243, 244),
            Color.fromARGB(255, 255, 249, 246),
            Color.fromARGB(255, 255, 254, 248),
            Color.fromARGB(255, 255, 254, 248),
          ])),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 15, right: 15.0, bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.small(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset("assets/images/logo_kucuk.png")),
                ],
              ),
              SignUpWidget(
                emailChanged: (email) => this.email = email,
                passwordChanged: (password) => this.password = password,
                fullNameChanged: (fullName) => this.fullName = fullName,
                numberChanged: (number) => this.number = number,
                ageChanged: (age) => this.age = age,
                complaintChanged: (complaint) => this.complaint = complaint,
                genderChanged: (gender) => this.gender = gender,
                jobChanged: (job) => this.job = job,
                schoolNameChanged: (schoolName) => this.schoolName = schoolName,
                schoolJobChanged: (schoolJob) => this.schoolJob = schoolJob,
                schoolClassChanged: (schoolClass) =>
                    this.schoolClass = schoolClass,
                onPressed: () async {
                  try {
                    //* We are using FireBaseAuth to create user.
                    //* And here we are waiting for the Future.
                    await auth.register(
                        email: email,
                        password: password,
                        fullName: fullName,
                        number: number,
                        age: age,
                        gender: gender,
                        complaint: complaint,
                        job: job,
                        schoolName: schoolName,
                        schoolClass: schoolClass,
                        schoolJob: schoolJob);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homePage(),
                        ),
                        (route) => false);
                  } on EmailAlreadyExistsAuthException {
                    await fireShowDialog(
                      context,
                      title: 'Kullanılmış Eposta Adresi!',
                      content: 'Lütfen Başka Bir Email Aderesi Deneyiniz.',
                    );
                  } on InvalidEmailAuthException {
                    await fireShowDialog(
                      context,
                      title: 'Geçersiz Email',
                      content: 'Lütfen Geçerli Bir Email giriniz',
                    );
                  } on WeakPasswordAuthException {
                    await fireShowDialog(
                      context,
                      title: 'Yeni Şifre Dene',
                      content: 'Lütfen Başka Bir Şifre Deneyin',
                    );
                  } on GenericAuthException {
                    await fireShowDialog(
                      context,
                      title: 'Hata!',
                      content: _errorMessage,
                    );
                  }
                },
                emailController: _emailController,
                passwordController: _passwordController,
                fullNameController: _fullNameController,
                numberController: _numberController,
                password0Controller: _password0Controller,
                ageController: _ageController,
                genderController: _genderController,
                complaintController: _complaintController,
                jobController: _jobController,
                schoolNameController: _schoolNameController,
                schoolJobController: _schoolJobController,
                schoolClassController: _schoolClassController,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
