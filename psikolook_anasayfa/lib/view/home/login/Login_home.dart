import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/psikolog_login_home.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signUpPage.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/loginPageBackground.png"),
                  fit: BoxFit.fill)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset("assets/images/logo_kucuk.png",
                      width: MediaQuery.of(context).size.width * 0.50)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 201, 139, 163),
                                    Color.fromARGB(255, 202, 141, 164),
                                    Color.fromARGB(255, 248, 234, 241),
                                  ])),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInPage()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 13, bottom: 13),
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 110, 174, 204),
                                    Color.fromARGB(255, 209, 231, 249),
                                    Color.fromARGB(255, 224, 242, 244)
                                  ])),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 13, bottom: 13),
                              child: Text(
                                "Kayıt Ol",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Divider(
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 238, 211, 204),
                                  Color.fromARGB(255, 250, 242, 232),
                                  Color.fromARGB(255, 254, 251, 245),
                                  Color.fromARGB(255, 242, 230, 220),
                                ])),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PsikologLoginHome()));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Ruh sağlığı çalışanıysan buraya tıkla",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/images/ruh_sagligi_Icon.png",
                                  width: 25,
                                  height: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/LoginPage_Image.png",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
