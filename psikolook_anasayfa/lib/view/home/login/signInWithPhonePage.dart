import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/home_page/home_page.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologK%C4%B1sm%C4%B1Iskeleti.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/psikolook_page.dart';

import 'ForgetPasswordPage.dart';

class SignInWithPhonePage extends StatefulWidget {
  const SignInWithPhonePage({super.key});

  @override
  State<SignInWithPhonePage> createState() => _SignInWithPhonePageState();
}

class _SignInWithPhonePageState extends State<SignInWithPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 15, right: 15.0, bottom: 0.0),
        child: Column(
          children: [
            Row(
              children: [
                FloatingActionButton.small(
                    elevation: 0,
                    backgroundColor: Color(0xFFFF0390),
                    child: Icon(
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
                SizedBox(
                  width: 10.0,
                ),
                Text("Telefon:",
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
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "Telefon Numaranız",
                        filled: true,
                        fillColor: Color(0xFFFEF2F5)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Text("Şifre:",
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
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "Şifreniz",
                        filled: true,
                        fillColor: Color(0xFFFEF2F5)),
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
                child: Text(
                  "E-Mail ile Giriş Yap",
                  style: TextStyle(
                      color: Color(0xFFFF0390),
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
                        backgroundColor: Color(0xFF5CE1E6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
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
                        child: Text("Şifremi Unuttum",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400))),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset("assets/images/psikolook-.png"),
          ],
        ),
      ),
    );
  }
}
