import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/ninthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/seventhPage.dart';


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
            context, MaterialPageRoute(builder: (context) => NinthPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,left: 10,right: 10,bottom:5),
            child: Text("Atla",style: TextStyle(fontSize: 24),),
          ),),
        ),
        body: Container(
           
         decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login8.png"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}