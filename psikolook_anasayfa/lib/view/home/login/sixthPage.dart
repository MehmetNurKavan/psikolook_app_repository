import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/ThirdPage.dart';
import 'package:psikolook_anasayfa/view/home/login/seventhPage.dart';


class SixthPage extends StatefulWidget {
  const SixthPage({super.key});

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top:15.0,right: 15.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      
    )
  )
),
            onPressed: () {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => SeventhPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,left: 10,right: 10,bottom:5),
            child: Text("Atla",style: TextStyle(fontSize: 24),),
          ),),
        ),
        body: Container(
        decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login6.png"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}