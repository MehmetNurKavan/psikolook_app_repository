import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/widget/animated_button.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AnimatedButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              child: Image.asset("assets/images/big_star.png")),
                          Image.asset("assets/images/stars.png"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Topluluk kısmında",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            "yaşadığın",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                      Text(
                        "olumlu / olumsuz",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                      Text(
                        "hayat deneyimlerini",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "paylaşabilir seninle aynı süreçlerden geçmiş kişilerle",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "etkileşim",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            "kurabilirisn",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/stars.png"),
                    const SizedBox(),
                  ],
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/four_photo.png"),
                            alignment: Alignment.bottomCenter),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/images/bush.png",height: 150,fit: BoxFit.fill),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
