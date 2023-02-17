import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/newpasswordPage.dart';
import 'package:psikolook_anasayfa/view/home/login/psikolog_new_password_page.dart';
import 'package:psikolook_anasayfa/view/home/psikolook/psikolook_page.dart';

class PsikologEpostaRefreancePage extends StatefulWidget {
  const PsikologEpostaRefreancePage({super.key});

  @override
  State<PsikologEpostaRefreancePage> createState() => _PsikologEpostaRefreancePageState();
}

class _PsikologEpostaRefreancePageState extends State<PsikologEpostaRefreancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 235, 240),
                Color.fromARGB(255, 255, 249, 246),
                Color.fromARGB(255, 255, 249, 246),
                Color.fromARGB(255, 255, 249, 246),
                Color.fromARGB(255, 255, 254, 248),
                Color.fromARGB(255, 255, 254, 248),

              ]

            )
          ),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5, height: 150),
                        FloatingActionButton.small(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                      ],
                    ),
                            
                    const Text(
                      'Şifrenizi mi unuttunuz?',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 75, left: 20, right: 20, bottom: 50),
                child: Column(
                  children: [
                    Text("E-posta adresinize gelen kodu giriniz:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                        buildReferansCodeTextField(),
                        buildReferansCodeTextField(),
                        buildReferansCodeTextField(),
                        buildReferansCodeTextField(),
                        buildReferansCodeTextField(),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                 foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PsikologNewPasswordPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: const Text(
                    'TAMAM',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildReferansCodeTextField() {
    return const SizedBox(
      width: 50,
      
      child: TextField(
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder( 
           // borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
