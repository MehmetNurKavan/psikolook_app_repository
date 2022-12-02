import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.pink[100],

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Şifrenizi mi unuttunuz?",style: TextStyle(fontSize: 26),),
          SizedBox(height: 20,),
          Text("E-posta adresinize gelen kodu giriniz",style: TextStyle(fontSize:18),),
          Row(
            children: [
              
            ],
          )
        ],
          
      ),
    ),
    );
  }
}