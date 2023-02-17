import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/epostaReferansPage.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  "Şifrenizi mi unuttunuz?",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("E-Postanızı Giriniz:",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: "E-Postanızı Giriniiz",
                      filled: true,
                      fillColor: Colors.white),
                ),
                const SizedBox(height: 30.0),
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
                            builder: (context) => const epostaRefreancePage()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 13, bottom: 13),
                    child: Text("Tamam"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Image.asset("assets/images/logo_kucuk.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
