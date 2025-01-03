import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/drawer/destekAl_page.dart';
import 'package:psikolook_anasayfa/view/partner/login/Login_home.dart';

class CikisYapPage extends StatefulWidget {
  const CikisYapPage({Key? key}) : super(key: key);

  @override
  State<CikisYapPage> createState() => _CikisYapPageState();
}

class _CikisYapPageState extends State<CikisYapPage> {
  final _auth = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 215, 226),
      body: buildCikisYap(context),
    );
  }

  Center buildCikisYap(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(100)),
          ),
          color: Colors.white,
          margin:
              const EdgeInsets.only(bottom: 150, top: 150, left: 35, right: 35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                const Text(
                  'Emin misin ?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: const [
                      Text('Gidişin bizi üzüyor...',
                          textAlign: TextAlign.center),
                      Text(
                          'Bir sorun olduysa uygulamaya dönüp bizden destek alabilirsin',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 217, 167, 179)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        await _auth.signOut();
                        /* Navigator.of(context).pop(); */
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginHomePage(),
                            ),
                            (route) => false);
                      } on Exception catch (e) {
                        log(e.toString());
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Text(
                              'Hata!',
                              style: TextStyle(color: Colors.red, fontSize: 40),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'EVET',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 128, 192, 210),
                            Color.fromARGB(255, 128, 192, 210),
                            Color.fromARGB(255, 227, 235, 232),
                          ])),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DestekAlPage()));
                    },
                    child: const Text(
                      'DESTEK AL',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'HAYIR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
