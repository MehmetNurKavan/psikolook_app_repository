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
              )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,right: 35),
                    child:Container(
                    alignment: Alignment(MediaQuery.of(context).size.height*0.0013,MediaQuery.of(context).size.height*0.1 ),
                      child: SizedBox(
                        
                        width: MediaQuery.of(context).size.width*0.25,
                        height: MediaQuery.of(context).size.height*0.055,
                        child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white54,
                         ),
                          onPressed: (){
                            Navigator.push( context,MaterialPageRoute(builder: (context) => const FifthPage()));
                          },
                           child: Text("Atla",style: TextStyle(color: Colors.pink[500]),)
                        ),
                        
                      ),
                    )             
                  ),
                 
                 //SizedBox(height: MediaQuery.of(context).size.height*0.2),
                 Container(
                  width: MediaQuery.of(context).size.width*0.9,
                   child: Text("STK'lar tarafından verilen referans kodunla Psikolook'tan ücretsiz destek de alabilirsin",textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 20.0,decoration: TextDecoration.none,color:Colors.white,fontFamily:'Raleway'),),
                 ),
                 Image.asset('assets/images/Image4.png'),
                 Image.asset('assets/images/psikolook-.png'),
                ],
              ),
            ),
      ),
    );
  }
}