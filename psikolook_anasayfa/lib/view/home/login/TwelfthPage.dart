import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/Login_home.dart';
import 'package:google_fonts/google_fonts.dart';
class TwelfthPage extends StatefulWidget {
  const TwelfthPage({super.key});

  @override
  State<TwelfthPage> createState() => _TwelfthPageState();
}

class _TwelfthPageState extends State<TwelfthPage> {
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
                  MaterialPageRoute(builder: (context) => const LoginHomePage()));
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
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/loginPageBackground.png"),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Anketler",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 19)),),
                            Text("Menü",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 19)),),
                            Text("Topluluk",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 19)),),
                            Text("Mesajlar",style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 19)),),
                          ],
                        ),
                        SizedBox(
                         // height: MediaQuery.of(context).size.height*0.65,
                          child: Image.asset("assets/images/Page12.png")),
                      ],
                    ),
                     /* SizedBox(
                      height: MediaQuery.of(context).size.height*0.7270,
                     ), */
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
        )
      ),
        ),
      );
  }
}
Widget customSizedBox() => SizedBox(
        height: 30,
      );
