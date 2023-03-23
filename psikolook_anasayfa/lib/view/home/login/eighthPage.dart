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
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: NextButton(function: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NinthPage()));
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
                "assets/images/Page8.png",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.12, horizontal: size.width * 0.03),
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.22),
                child: Text(
                  "Profilin",
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(fontSize: 18)),
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
