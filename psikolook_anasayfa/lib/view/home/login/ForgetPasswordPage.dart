import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/home_page/home_page.dart';
import 'package:psikolook_anasayfa/view/home/login/signInWithPhonePage.dart';
import 'package:psikolook_anasayfa/view/home/login/verificationPage.dart';




class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:50.0,left: 15,right: 15.0,bottom:0.0),
          child: Column(
                              children: [
                              Row(
                                children: [
                                  FloatingActionButton.small(
                                    
                                    elevation: 0,
                                    backgroundColor: Color(0xFFFF0390),
                                    child: Icon(Icons.arrow_back_ios_new,),
                                    onPressed: (){
                                    Navigator.push( context,MaterialPageRoute(builder: (context) => const SignInWithPhonePage()));
                                    
                                    }),
                                ],
                              ),       
                                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                                Text("Şifrenizi mi unuttunuz?",style: TextStyle(fontSize: 28),), 
                                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                                Row(
                                  
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("E-Postanızı Giriniz:",style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                                  
                                  
                                  ],
                                ),
                                TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction:TextInputAction.next,
                       decoration: InputDecoration(
                        
                        border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0,style: BorderStyle.none),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                
                        
                        ),
                                 hintText: "E-Postanızı Giriniiz",
                                 filled: true,
                                 fillColor: Color(0xFFFEF2F5) ),),
                                 SizedBox(height: 30.0),
                                 ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFF0390),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(20.0) ,
                                    ),textStyle: TextStyle(fontSize: 24),
                                  ),
                                  
                                  onPressed:  (){
                                     
                                      Navigator.push( context,MaterialPageRoute(builder: (context) => const homePage()));
                                  }, child: Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 30,top:13,bottom: 13),
                                    
                                    child: Text("Tamam"),
                                  ),
                        ),
                       SizedBox(height:MediaQuery.of(context).size.height*0.34),
                            Image.asset("assets/images/psikolook-.png"),
                                
                                ],
                                
          ),
        ),
      ),

    );
  }
}