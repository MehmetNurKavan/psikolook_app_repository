import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/PsikologsingInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/psikolog_sing_up.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signUpPage.dart';

class PsikologLoginHome extends StatefulWidget {
  const PsikologLoginHome({super.key});

  @override
  State<PsikologLoginHome> createState() => _PsikologLoginHomeState();
}

class _PsikologLoginHomeState extends State<PsikologLoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body: SingleChildScrollView(
        child: Container(
         decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/loginPageBackground.png"),fit: BoxFit.fill)
         ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            
            children: [
              
              Expanded(
                  child: Image.asset("assets/images/logo_kucuk.png",
                      width: MediaQuery.of(context).size.width * 0.50)),
              Expanded(
                
                child: Column(
                  
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                            Text("Ruh sağlığı çalışanı girişi      ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Image.asset("assets/images/ruh_sagligi_Icon.png",height: MediaQuery.of(context).size.height*0.035,),
                          ],
                        ),
                        SizedBox(height: 2,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          
                          child: Divider(
                            height: 5,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Container(
                          
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                     Color.fromARGB(255, 201, 139, 163),
                                     Color.fromARGB(255, 202, 141, 164),
                                     Color.fromARGB(255, 248, 234, 241),
                                  ]
                                  )
                              ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: TextStyle(fontSize: 24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PsikologSignInPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 13, bottom: 13),
                              child: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
                              
                            ),
                          ),
                        ),
                         Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                     Color.fromARGB(255, 110, 174, 204),
                                     Color.fromARGB(255, 209, 231, 249),
                                     Color.fromARGB(255, 224, 242, 244)
                                  ]
                                  )
                              ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: TextStyle(fontSize: 24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => psikologSignUpPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 13, bottom: 13),
                              child: Text("Kayıt Ol",style: TextStyle(color: Colors.white),),
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/LoginPage_Image.png",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



 /* decoration: BoxDecoration(
            gradient:LinearGradient(begin:Alignment.topLeft,
                                    end:Alignment.bottomRight,
                                    tileMode: TileMode.decal,
                                    colors: [
                                      Color.fromARGB(255, 201, 140, 163),
                                        Color.fromARGB(255, 201, 140, 163),
                                        Color.fromARGB(255, 255, 234, 240),
                                        Color.fromARGB(255, 247, 234, 225),
                                        Color.fromARGB(255, 115, 177, 205),
                                        Color.fromARGB(255, 147, 243, 250),
                                        Color.fromARGB(255, 255, 254, 248),
                                    ] )
          ), */