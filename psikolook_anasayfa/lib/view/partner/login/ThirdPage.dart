import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fourthPage.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LoginTheme2.png"), fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/images/big_star.png"),
                          const SizedBox(width: 40.0),
                        ],
                      ),
                      Image.asset("assets/images/stars.png"),
                      Text(
                        "Psikolook sana en uygun",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 22)),
                      ),
                      Text(
                        "psikologu / danışmanı",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "bulmanı sağlar",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 22)),
                      ),
                    ],
                  ),
                  Expanded(child: Image.asset("assets/images/two_photo.png")),
                  /* Image.asset("assets/images/logo_kucuk.png"), */
                ],
              ),
            )),
      ),
    );
  }
}
