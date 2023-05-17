import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/TwelfthPage.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

class EleventhPage extends StatefulWidget {
  const EleventhPage({Key? key}) : super(key: key);
  @override
  State<EleventhPage> createState() => _EleventhPageState();
}

class _EleventhPageState extends State<EleventhPage> {
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
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Page11.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Expanded(
                        child: Text(
                          "Psikologunla görüşme linkin\nburada yer alır, seanstan önce\nburaya gelip linke tıklaman yeterli",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 16)),
                        ),
                      ),
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
