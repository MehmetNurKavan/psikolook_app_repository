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
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: NextButton(function: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginHomePage()));
        }),
        body: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/loginPageBackground.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: size.width * 0.03, horizontal: size.width * 0.03),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/logo_kucuk.png"),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.13, horizontal: size.width * 0.06),
            //color: Colors.amber,
            child: Center(
              child: Image.asset(
                "assets/images/Page12.png",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.10, horizontal: size.width * 0.03),
            child: Padding(
              padding: const EdgeInsets.only(left:2.0,right: 2.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Anketler",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                    Text(
                      "Menü",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                    Text(
                      "Topluluk",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                    Text(
                      "Mesajlar",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
