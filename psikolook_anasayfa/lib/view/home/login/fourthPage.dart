import 'package:flutter/material.dart';

import 'fifthPage.dart';

class fourthPage extends StatefulWidget {
  const fourthPage({super.key});

  @override
  State<fourthPage> createState() => _fourthPageState();
}

class _fourthPageState extends State<fourthPage> {
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
            context, MaterialPageRoute(builder: (context) => FifthPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,left: 10,right: 10,bottom:5),
            child: Text("Atla",style: TextStyle(fontSize: 24),),
          ),),
        ),
        body: Container(
          
         decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login4.png"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
