import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 28);
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LoginTheme2.png"), fit: BoxFit.fill),
            ),
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
                Image.asset("assets/images/one_photo.png"),
              ],
            )),
      ),
    );
  }
}
