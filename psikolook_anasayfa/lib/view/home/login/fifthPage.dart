import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/sixthPage.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.175,
                ),
                Column(
                  children: [
                    Text(
                      "Aynı zamanda Psikologların",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 20)),
                    ),
                    Text(
                      "blog yazılarını okuyabilir,",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "paylaşımlarını ",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "takip edebilirsin",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset("assets/images/Image4.png"),
                Image.asset("assets/images/logo_kucuk.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
