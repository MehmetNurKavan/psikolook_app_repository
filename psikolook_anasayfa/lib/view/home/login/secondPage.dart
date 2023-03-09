import 'package:flutter/material.dart';
import 'ThirdPage.dart';
import 'package:google_fonts/google_fonts.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 28);
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
                  MaterialPageRoute(builder: (context) => const thirdPage()));
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
            Column(children: [Text("Hoş Geldin!",style: GoogleFonts.montserrat(textStyle:style)),
          customSizedBox(),
          Text("Psikologlarımızla beraber",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20)),),
          Text("bir yolculuğa çıkmaya",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
          Text("ne dersiniz?",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20)),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.15,
            ),
          Image.asset("assets/images/girisresim1.png"),
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

//Text("Hoş Geldin!",style: GoogleFonts.montserrat(textStyle:style)),
/*
decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LoginTheme.png"),
                  fit: BoxFit.fill)),
*/
/*
Image.asset("assets/images/LoginTheme.png",fit: BoxFit.fill,),
          Text("Hoş Geldin!",style: GoogleFonts.montserrat(textStyle:style)),
          customSizedBox(),
          Text("Psikologlarımızla beraber",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22)),),
          Text("bir yolculuğa çıkmaya",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),),
          Text("ne dersiniz?",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 22)),),

*/