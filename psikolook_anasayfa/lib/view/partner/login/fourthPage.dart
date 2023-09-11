import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LoginTheme2.png"),
                  fit: BoxFit.fill),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bush2.png"),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitWidth),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.175,
                  ),
                  Column(
                    children: [
                      Text(
                        "Depremzede dostumuzu da unutmadik Psikolook'tan",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                      Text(
                        "gönüllü psikologlar",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "ile ücretsiz destek alabilirsiniz",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              Image.asset("assets/images/cloudy_photo.png",width: 150),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset("assets/images/cloudy_photo.png",width: 150),
                                ],
                              ),
                              Image.asset("assets/images/three_photo1.png",height: 250),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Image.asset("assets/images/three_photo2.png")),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}