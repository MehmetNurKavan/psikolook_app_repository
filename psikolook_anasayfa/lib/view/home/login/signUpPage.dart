import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/sixthPage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _value=1;
  bool isChecked = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top:25.0,left: 15,right: 15.0,bottom:25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.small(
                        
                        elevation: 0,
                        backgroundColor: Color(0xFFFF0390),
                        child: Icon(Icons.arrow_back_ios_new,),
                        onPressed: (){
                        Navigator.push( context,MaterialPageRoute(builder: (context) => const SixthPage()));
                        }),
                       
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                          
                            Padding(
                              padding: const EdgeInsets.only(right:15.0),
                              child: Image.asset("assets/images/psikolook-.png",height: 50,),
                            ),
                            SizedBox(height: 8,)
                          ],
                        )
                    ],
                  ),
                  
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    
                    buildSignUpView("Adınız Soyadınız",TextInputType.name,),
                    buildSignUpView("E-Posta",TextInputType.emailAddress),
                    buildSignUpView("Yaş",TextInputType.number),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                      SizedBox(width: 10,),
                       Text("Cinsiyetiniz",style: TextStyle(fontWeight: FontWeight.bold),),
                     ],
                   ),
                    gender(),
                    buildSignUpView("Şikayetiniz",TextInputType.name),
                    buildSignUpView("Mesleğiniz",TextInputType.name),
                    buildSignUpView("Telefon",TextInputType.number),
                    buildSignUpView("Öğrenciyseniz Okuduğunuz Okulun Adı",TextInputType.name),
                    buildSignUpView("Öğrenciyseniz Bölümünüz",TextInputType.name),
                    buildSignUpView("Öğrenciyseniz Sınıfınız",TextInputType.name),
                    buildSignUpView("Şifreniz",TextInputType.name),
                    buildSignUpView("Şifrenizi Tekrar Giriniz",TextInputType.name),
                    buildSignUpView("Referans Kodunuz",TextInputType.number),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text("Referans kodunuzu girmeden ücretsiz psikolojik destek alamazsınız,referans kodunuzu henüz bilmiyorsanız uygulamaya giriş yaptıktan sonra da girebilirsiniz",
                      style:TextStyle(color: Colors.pink,fontWeight:FontWeight.bold,)),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("KVKK'yı okudum onaylıyorum",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 13),),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Card(
                                  
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                        checkColor: Colors.pink,
                                                        activeColor: Colors.pink,
                                                        fillColor: MaterialStateProperty.all(Colors.white),
                                                        value: isChecked,
                                                        onChanged: (bool? value) {
                                                          setState(() {
                                  isChecked = value!;
                                                          });
                                                        },
                                                  ),
                                ),
                              ), 
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kullanıcı Sözleşmesini okudum kabul ediyorum",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 13),),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Card(
                                  
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      checkColor: Colors.pink,
                                       activeColor: Colors.pink,
                                        fillColor: MaterialStateProperty.all(Colors.white),
                                          value: isChecked2,
                                           onChanged: (bool? value) {
                                            setState(() {
                                             isChecked2 = value!;
                                              });
                                                },),
                                ),
                              ), 
                            ],
                          ),
                        ],
                      ),

                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(92, 225, 230, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20.0) ,
                          ),textStyle: TextStyle(fontSize: 24),
                        ),
                        onPressed:  (){
                           
                            Navigator.push( context,MaterialPageRoute(builder: (context) => const SignInPage()));
                        }, child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30,top:13,bottom: 13),
                          child: Text("Kayıt Ol"),
                        ),
                      ),
                      ],
                    )
                    ]
                         ,),
                         ],
                   ),
          ),
        ),
      ),
    );
  }
  Column buildSignUpView(value,_kytp) {
    return Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width:10.0),
                        Text(value,style:TextStyle(fontWeight: FontWeight.bold,)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      keyboardType: _kytp,
                      textInputAction:TextInputAction.next,
                     decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      
                      ),
                         hintText: value,
                         filled: true,
                         fillColor: Color(0xFFFEF2F5) ),),
                         SizedBox(height: 15,)
                  ],
                ); }
  gender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
     children:[
      Row(
        children: [
          Radio(
            activeColor: Colors.pink,
          value:1,
          groupValue: _value,
          onChanged: (value){
            setState(() {
              _value= value!;
            });
          }
          ),
          Text("Kadın"),
          Icon(Icons.female)
        ],
      ),
      Row(
        children: [
          Radio(
            activeColor: Colors.pink,
          value:2,
          groupValue: _value,
          onChanged: (value){
             setState(() {
              _value= value!;
            });
          }
          ),
          Text("Erkek"),
          Icon(Icons.male)
        ],
      ),Row(
        children: [
          Radio(
            activeColor: Colors.pink,
          value:3,
          groupValue: _value,
          onChanged: (value){
             setState(() {
              _value= value!;
            });
          }
          ),
          Text("Diğer"),
          Icon(Icons.transgender)
        ],
      )
     ],
      );
    
  }
}

