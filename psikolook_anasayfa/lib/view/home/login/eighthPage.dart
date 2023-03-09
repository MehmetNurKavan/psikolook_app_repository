import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/ninthPage.dart';

class EighthPage extends StatefulWidget {
  const EighthPage({super.key});

  @override
  State<EighthPage> createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 15.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NinthPage()));
            },
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 5),
              child: Text(
                "Atla",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/loginPageBackground.png"),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(right:20.0,bottom:0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage("assets/images/Page8.png"),fit: BoxFit.fitWidth)
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                      height: MediaQuery.of(context).size.height*0.060,
                      ),
                      Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*0.10),
                          Text(" Profilin",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 19)),),
                        ],
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height*0.7470,
                       ),
                      Center(
                        child: Column(
                          children: [
                            Image.asset("assets/images/logo_kucuk.png"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
        ),
      );
  }
}
Widget customSizedBox() => SizedBox(
        height: 30,
      );
