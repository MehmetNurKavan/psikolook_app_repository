import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/Login_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

class TwelfthPage extends StatefulWidget {
  const TwelfthPage({Key? key}) : super(key: key);

  @override
  State<TwelfthPage> createState() => _TwelfthPageState();
}

class _TwelfthPageState extends State<TwelfthPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/LoginTheme2.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Page12.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Anketler",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Menü",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Topluluk",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Mesajlar",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 20, child: Image.asset("assets/images/logo_kucuk.png")),
          ],
        ),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
