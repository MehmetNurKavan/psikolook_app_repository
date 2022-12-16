import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/PsikologsingInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/psikolog_sing_up.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signUpPage.dart';

class PsikologLoginHome extends StatefulWidget {
  const PsikologLoginHome({super.key});

  @override
  State<PsikologLoginHome> createState() => _PsikologLoginHomeState();
}

class _PsikologLoginHomeState extends State<PsikologLoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset("assets/images/psikolook-.png",
                      width: MediaQuery.of(context).size.width * 0.45)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 3, 144, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PsikologSignInPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 13, bottom: 13),
                            child: Text("Giriş Yap"),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(92, 255, 230, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const psikologSignUpPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 13, bottom: 13),
                            child: Text("Kayıt Ol"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Divider(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/Image_Login_page.png",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
