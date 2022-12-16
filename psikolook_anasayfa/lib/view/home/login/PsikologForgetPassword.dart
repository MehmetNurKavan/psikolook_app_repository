import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/psikolog_epostaReferance.dart';
import 'package:psikolook_anasayfa/view/home/login/psikologSingInPhoneNumber.dart';
import 'epostaReferansPage.dart';

class PsikologForgetPasswordPage extends StatefulWidget {
  const PsikologForgetPasswordPage({super.key});

  @override
  State<PsikologForgetPasswordPage> createState() =>
      _PsikologForgetPasswordPageState();
}

class _PsikologForgetPasswordPageState
    extends State<PsikologForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      backgroundColor: Color(0xFFFF0390),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PsikologSignInWithPhonePage()));
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Şifrenizi mi unuttunuz?",
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("E-Postanızı Giriniz:",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "E-Postanızı Giriniiz",
                    filled: true,
                    fillColor: Color(0xFFFEF2F5)),
              ),
              SizedBox(height: 30.0),
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
                          builder: (context) =>
                              const PsikologEpostaRefreancePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 13, bottom: 13),
                  child: Text("Tamam"),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Image.asset("assets/images/psikolook-.png"),
            ],
          ),
        ),
      ),
    );
  }
}
