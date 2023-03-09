import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/home/login/TwelfthPage.dart';
class EleventhPage extends StatefulWidget {
  const EleventhPage({super.key});
  @override
  State<EleventhPage> createState() => _EleventhPageState();
}
class _EleventhPageState extends State<EleventhPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
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
                  MaterialPageRoute(builder: (context) => const TwelfthPage()));
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
              padding: const EdgeInsets.only(right:10.0,bottom:25),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage("assets/images/Page11.png"))
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                      height: MediaQuery.of(context).size.height*0.09,
                      ),
                      Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*0.10),
                          Expanded(child: Text("Psikologunla görüşme linkin/danışmanları\nburada yer alır,seanstan önce\nburaya gelip linke tıklaman yeterli",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 16)),)),  
                        ],
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height*0.6490,
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