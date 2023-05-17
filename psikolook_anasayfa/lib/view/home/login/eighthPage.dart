import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/ninthPage.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

class EighthPage extends StatefulWidget {
  const EighthPage({Key? key}) : super(key: key);

  @override
  State<EighthPage> createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage> {
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
                        "assets/images/Page8.png",
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
                          "Profilin",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 19)),
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
