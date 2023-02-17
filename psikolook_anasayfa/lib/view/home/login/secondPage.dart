import 'package:flutter/material.dart';

import 'ThirdPage.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
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
            context, MaterialPageRoute(builder: (context) => thirdPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,left: 10,right: 10,bottom:5),
            child: Text("Atla",style: TextStyle(fontSize: 24),),
          ),),
        ),
        body: Container(
         // child: Image.asset("assets/images/login2.png"),
          decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/login2.png"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}