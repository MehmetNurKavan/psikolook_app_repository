import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/sixthPage.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
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
                  MaterialPageRoute(builder: (context) => const SixthPage()));
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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/LoginTheme.png"),fit: BoxFit.fill),
          ),
        child: Column(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height*0.20,

            ),
            Column(children: [
          customSizedBox(),
          Text("Aynı zamanda Psikolook'ların",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20)),),
          Text("blog yazılarını okuyabilir,",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("paylaşımlarını ",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
              Text("takip edebilirsin",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20)),),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.15,
            ),
          
          Image.asset("assets/images/Image4.png"),
          Image.asset("assets/images/logo_kucuk.png"),
          ],),
          ],
        )
        ), 
      ),
     ),
    );
  }
}
Widget customSizedBox() => SizedBox(
        height: 30,
      );