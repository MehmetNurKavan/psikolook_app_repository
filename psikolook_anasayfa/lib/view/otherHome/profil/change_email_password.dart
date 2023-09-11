import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/update_person.dart';
import 'package:psikolook_anasayfa/widget/delay_page.dart';

class UpdateUserEmailPassword extends StatefulWidget {
  final uid;
  const UpdateUserEmailPassword({Key? key, required this.uid})
      : super(key: key);

  @override
  State<UpdateUserEmailPassword> createState() =>
      _UpdateUserEmailPasswordState();
}

class _UpdateUserEmailPasswordState extends State<UpdateUserEmailPassword> {
  final _emailController = TextEditingController();
  final _emailController2 = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isVisble = true;
  bool isNotVisible = false;
  bool isNotVisible2 = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailController2.dispose();
    super.dispose();
  }

  unfocus() {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  int dkk = 0;

  /* Future<int> async1() {
    return Future.delayed(const Duration(seconds: 240)).then((onValue) => dkk);
  } */

  void changeUser() async {
    unfocus();
    setState(() {
      _isLoading = true;
    });
    if (_emailController.text != '' &&
        _passwordController.text != '' &&
        _emailController2.text != '') {
      String res = await AuthMethods().changeUser(
          email: _emailController.text,
          password: _passwordController.text,
          newemail: _emailController2.text);
      if (res == 'success') {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => UpdatPersonPage(uid: widget.uid)));
        });
      } else if (res == 'bekleniliyor') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DelayPage(),
        ));
      } else {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => UpdatPersonPage(uid: widget.uid)));
        });
        showSnackBar(context, res);
      }
    } else {
      showSnackBar(context, 'Tüm değerleri doldurunuz');
    }
  }

  void resetPassword() async {
    // signup user using our authmethodds
    String? res =
        await OtherAuthMethods().forgotPassword(_emailController.text);
    // if string returned is sucess, user has been created
    if (res == "e-posta adresinizi kontrol ediniz") {
      setState(() {
        Navigator.pop(context);
      });
    } else {}
    showSnackBar(context, res!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backGroundColor)),
        child: _isLoading
            ? circleLoading()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50.0, left: 15, right: 15.0, bottom: 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FloatingActionButton.small(
                              elevation: 0,
                              backgroundColor: Colors.black,
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatPersonPage(uid: widget.uid),
                                    ));
                              }),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      const Text(
                        "E-posta ve şifre değişimi",
                        style: TextStyle(fontSize: 26),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Visibility(
                          visible: isVisble,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isVisble = !isVisble;
                                    isNotVisible2 = !isNotVisible2;
                                  });
                                },
                                child: const Text("E-posta yenile"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isVisble = !isVisble;
                                    isNotVisible = !isNotVisible;
                                  });
                                },
                                child: const Text("Şifreyi yenile"),
                              ),
                            ],
                          )),
                      Visibility(
                        visible: isNotVisible,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  labelText: "E-Postanızı Giriniz",
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                resetPassword();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 13, bottom: 13),
                                child: Text("şifreyi yenile"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isNotVisible2,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  labelText: "E-Postanızı Giriniz",
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  labelText: "Şifrenizi Giriniz",
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextFormField(
                              controller: _emailController2,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  labelText: "Yeni E-Postanızı Giriniz",
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                //changeUser();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 13, bottom: 13),
                                child: Text("E-posta yenile"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Image.asset("assets/images/logo_kucuk.png"),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
