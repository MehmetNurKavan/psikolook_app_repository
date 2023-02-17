import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'ForgetPasswordPage.dart';

class SignInWithPhonePage extends StatefulWidget {
  const SignInWithPhonePage({super.key});

  @override
  State<SignInWithPhonePage> createState() => _SignInWithPhonePageState();
}

class _SignInWithPhonePageState extends State<SignInWithPhonePage> {
  bool _obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 253, 215, 226),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 255, 235, 240),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 254, 248),
              Color.fromARGB(255, 255, 254, 248),
            ])),
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
                        Navigator.pop(context);
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text("Telefon:",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Center(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Telefon Numaranız",
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text("Şifre:",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                              color: Colors.black,
                              icon: Icon(_obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Şifreniz",
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent.withOpacity(0),
                      shadowColor: Colors.transparent.withOpacity(0),
                      foregroundColor: Colors.transparent.withOpacity(0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: const Text(
                    "E-Mail ile Giriş Yap",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          textStyle: const TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const homePage()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 13, bottom: 13),
                          child: Text("Giriş Yap"),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordPage()));
                          },
                          child: const Text("Şifremi Unuttum",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/images/logo_kucuk.png"),
            ],
          ),
        ),
      ),
    );
  }
}
