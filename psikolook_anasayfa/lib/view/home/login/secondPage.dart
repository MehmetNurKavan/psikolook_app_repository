import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';
import 'ThirdPage.dart';
import 'package:google_fonts/google_fonts.dart';

class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 28);
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LoginTheme.png"),
                  fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.175,
                      ),
                      Text("Hoş Geldin!",
                          style: GoogleFonts.montserrat(textStyle: style)),
                      customSizedBox(),
                      Text(
                        "Psikologlarımızla beraber",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                      Text(
                        "bir yolculuğa çıkmaya",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "ne dersiniz?",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  Image.asset("assets/images/girisresim1.png"),
                  Image.asset("assets/images/logo_kucuk.png"),
                ],
              ),
            )),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
