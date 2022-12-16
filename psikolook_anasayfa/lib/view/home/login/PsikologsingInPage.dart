import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/PsikologForgetPassword.dart';
import 'package:psikolook_anasayfa/view/home/login/psikologSingInPhoneNumber.dart';
import 'package:psikolook_anasayfa/view/home/login/signUpPage.dart';
import '../psikologHome/psikologKısmıIskeleti.dart';

class PsikologSignInPage extends StatefulWidget {
  const PsikologSignInPage({super.key});

  @override
  State<PsikologSignInPage> createState() => _PsikologSignInPageState();
}

class _PsikologSignInPageState extends State<PsikologSignInPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, left: 15, right: 15.0, bottom: 0.0),
          child: Column(
            children: [
              Row(
                children: [
                  FloatingActionButton.small(
                      elevation: 0,
                      backgroundColor: Color(0xFF5CE1E6),
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
                  Text("E-Mail:",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "E-Mail Adresiniz",
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: TextField(
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              color: Color(0xFF5CE1E6),
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
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
                            builder: (context) =>
                                const PsikologSignInWithPhonePage()));
                  },
                  child: Text(
                    "Telefon Numarasıyla Giriş Yap",
                    style: TextStyle(
                        color: Color(0xFF5CE1E6),
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
                          backgroundColor: Color(0xFFFF0390),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const psikolog_page()));
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
                                        const PsikologForgetPasswordPage()));
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
      ),
    );
  }
}