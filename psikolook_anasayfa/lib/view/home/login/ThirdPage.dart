import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';
import 'fourthPage.dart';

class thirdPage extends StatefulWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: NextButton(
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const fourthPage()));
          },
        ),
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
                        customSizedBox(),
                        Text(
                          "Psikolook sana en uygun",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 22)),
                        ),
                        Text(
                          "psikologu / danışmanı",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "bulmanı sağlar",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 22)),
                        ),
                      ],
                    ),
                    Image.asset("assets/images/Image2.png"),
                    Image.asset("assets/images/logo_kucuk.png"),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
