import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
//!henüz kullanmadık bu sayfayı
class PsikologForgetPasswordPage extends StatefulWidget {
  const PsikologForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<PsikologForgetPasswordPage> createState() =>
      _PsikologForgetPasswordPageState();
}

class _PsikologForgetPasswordPageState
    extends State<PsikologForgetPasswordPage> {
  final _emaliController = TextEditingController();

  @override
  void dispose() {
    _emaliController.dispose();
    super.dispose();
  }

  void resetPassword() async {
    // signup user using our authmethodds
    String? res = await AuthMethods().forgotPassword(_emaliController.text);
    // if string returned is sucess, user has been created
    if (res == "e-posta adresinizi kontrol ediniz") {
      setState(() {
        Navigator.pop(context);
      });
    }
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
                  children: const <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text("E-Postanızı Giriniz:",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emaliController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: "E-Postanızı Giriniz",
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
                    resetPassword();
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
