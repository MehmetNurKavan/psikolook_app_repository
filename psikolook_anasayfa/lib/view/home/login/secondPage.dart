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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 201, 33, 153),
            Color.fromARGB(255, 206, 72, 159),
            Color.fromARGB(255, 201, 116, 147),
            Color.fromARGB(255, 243, 217, 169),
            Color.fromARGB(255, 253, 215, 226),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 35),
                  child: Container(
                    alignment: Alignment(
                        MediaQuery.of(context).size.height * 0.0013,
                        MediaQuery.of(context).size.height * 0.1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.055,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white54,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const thirdPage()));
                          },
                          child: Text(
                            "Atla",
                            style: TextStyle(color: Colors.pink[500]),
                          )),
                    ),
                  )),
              Text(
                "Hoş Geldin!",
                style: TextStyle(
                    fontSize: 40.0,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal),
              ),
              //SizedBox(height: MediaQuery.of(context).size.height*0.2),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Psikologlarımızla beraber bir yolculuğa çıkmaya ne dersin?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontFamily: 'Raleway'),
                ),
              ),
              Image.asset('assets/images/girisresim1.png'),
              Image.asset('assets/images/psikolook-.png'),
            ],
          ),
        ),
      ),
    );
  }
}








/*  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton.extended(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const secondPage())
            );
          },
          
      label:Text("Atla",style:TextStyle(fontSize: 25.0,color: Colors.pink[400],) ),
      backgroundColor: Colors.white,
      splashColor: Colors.pink[500],hoverColor: Colors.black,
      
      
      ),
                       SizedBox(width: 20,),
                    ],
                  ), */