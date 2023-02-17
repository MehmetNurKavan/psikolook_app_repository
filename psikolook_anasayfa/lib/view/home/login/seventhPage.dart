import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/eighthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/sixthPage.dart';


class SeventhPage extends StatefulWidget {
  const SeventhPage({super.key});

  @override
  State<SeventhPage> createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
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
            context, MaterialPageRoute(builder: (context) => EighthPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,left: 10,right: 10,bottom:5),
            child: Text("Atla",style: TextStyle(fontSize: 24),),
          ),),
        ),
        body: Container(
           
        decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login7.png"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}