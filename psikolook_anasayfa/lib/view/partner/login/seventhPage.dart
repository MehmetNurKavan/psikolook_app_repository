import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeventhPage extends StatefulWidget {
  const SeventhPage({Key? key}) : super(key: key);

  @override
  State<SeventhPage> createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/three.png",
            ),
            fit: BoxFit.fill,
          ),
        ), */
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
                        "assets/images/Page7.png",
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
                          "Burası ana sayfa, buraya\ntekrar dönmek istediğinde\n ev simgesine basıp dönebilirsin",
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



//Burası ana sayfa, buraya\ntekrar dönmek istediğinde\n ev simgesine basıp dönebilirsin