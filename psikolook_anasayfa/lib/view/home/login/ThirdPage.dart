import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fourthPage.dart';

class thirdPage extends StatefulWidget {
  const thirdPage({super.key});

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
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
                  MaterialPageRoute(builder: (context) => const fourthPage()));
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
          Text("Psikolook sana en uygun ",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22)),),
          Text("psikologu / danışmanı ",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),),
          Text("bulmanı sağlar",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22)),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.15,
            ),
          Image.asset("assets/images/Image2.png"),
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
    
  