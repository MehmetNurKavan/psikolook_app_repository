import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

import 'fifthPage.dart';

class fourthPage extends StatefulWidget {
  const fourthPage({Key? key}) : super(key: key);

  @override
  State<fourthPage> createState() => _fourthPageState();
}

class _fourthPageState extends State<fourthPage> {
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
                  Text(
                    "STK'lar tarafından verilenreferans\nkodunla Psikolook'tan ücretsiz\ndestek de alabilirsin",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(fontSize: 20)),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset("assets/images/image3.png"),
                  Image.asset("assets/images/logo_kucuk.png"),
                ],
              ),
            )),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 20);
